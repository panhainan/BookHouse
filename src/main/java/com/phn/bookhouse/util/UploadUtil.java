package com.phn.bookhouse.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

/**
 * 上传图片　工具类 大图片路径,生成小图片路径, 大图片文件名,生成小图片文名, 生成小图片宽度,生成小图片高度, 是否等比缩放(默认为true))
 * 
 * @author Administrator
 * 
 */
public class UploadUtil {
	private String imagePath = "/bookIMG/"
			+ new SimpleDateFormat("yyyyMMddHH").format(new Date()) + "";// 配置图片路径

	/**
	 * 
	 * @param getUpload
	 *            路径
	 * @param getUploadContentType
	 *            文件类型
	 * @param getUploadFileName
	 *            原文件名
	 * @return fileNewName
	 *            新文件名
	 * @throws IOException
	 */
	public String uploadImage1(HttpServletRequest request, MultipartFile file,
			String getUploadContentType, String getUploadFileName)
			throws IOException {

		String getImagePath = request.getSession().getServletContext()
				.getRealPath(imagePath);

		File image = new File(getImagePath);
		if (!image.exists()) {
			image.mkdir();
		}

		// 得到上传文件的后缀名
		String uploadName = getUploadContentType;
		System.out.println("图片类型 ------------" + uploadName);

		String lastuploadName = uploadName.substring(
				uploadName.indexOf("/") + 1, uploadName.length());
		System.out.println("得到上传文件的后缀名 ------------" + lastuploadName);

		// 得到文件的新名字
		String fileNewName = generateFileName(getUploadFileName);
		System.out.println("// 得到文件的新名字 ------------" + fileNewName);

		// FileOutputStream fos = new FileOutputStream(getImagePath + "/" +
		// fileNewName);
		//
		// FileInputStream fis = new FileInputStream(getUpload);
		// byte[] buffer = new byte[1024];
		// int len = 0;
		// while ((len = fis.read(buffer)) > 0) {
		// fos.write(buffer, 0, len);
		// }

		// 最后返回图片路径
		imagePath = imagePath + "/" + fileNewName;
		System.out.println("回图片路径   " + file.getInputStream());
		System.out.println("//最后返回图片路径   " + imagePath);

		BufferedImage srcBufferImage = ImageIO.read(file.getInputStream());
		System.out.println("宽度：" + srcBufferImage.getWidth() + "\t高度："
				+ srcBufferImage.getHeight());
		BufferedImage scaledImage;
		ScaleImage scaleImage = ScaleImage.getInstance();
		int yw = srcBufferImage.getWidth();
		int yh = srcBufferImage.getHeight();
		int w = 400, h = 300;
		// 如果上传图片 宽高 比 压缩的要小 则不压缩
		if (w > yw && h > yh) {
			FileOutputStream fos = new FileOutputStream(getImagePath + "/"
					+ fileNewName);

			FileInputStream fis = (FileInputStream) file.getInputStream();
			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = fis.read(buffer)) > 0) {
				fos.write(buffer, 0, len);
			}
		} else {
			scaledImage = scaleImage.imageZoomOut(srcBufferImage, w, h);
			FileOutputStream out = new FileOutputStream(getImagePath + "/"
					+ fileNewName);
			ImageIO.write(scaledImage, "jpeg", out);

		}
		return imagePath;
	}

	/**
	 * 传入原图名称，，获得一个以时间格式的新名称
	 * 
	 * @param fileName
	 *            　原图名称
	 * @return
	 */
	private String generateFileName(String fileName) {
		DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String formatDate = format.format(new Date());
		int random = new Random().nextInt(10000);
		int position = fileName.lastIndexOf(".");
		String extension = fileName.substring(position);
		return formatDate + random + extension;
	}

	public String getImagepath() {
		return imagePath;
	}

}