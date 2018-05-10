package com.sm.util;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

public class GeneratetwoDimensionalcode {
	// 图片宽度的一般
	private static final int IMAGE_WIDTH = 100;
	private static final int IMAGE_HEIGHT = 100;
	private static final int IMAGE_HALF_WIDTH = IMAGE_WIDTH / 2;
	private static final int FRAME_WIDTH = 2;

	// 二维码写码器
	private static MultiFormatWriter mutiWriter = new MultiFormatWriter();

	/**
	 * 
	 * @param content
	 *            二维码显示的文本
	 * @param width
	 *            二维码的宽度
	 * @param height
	 *            二维码的高度
	 * @param srcImagePath
	 *            中间嵌套的图片
	 * @param destImagePath
	 *            二维码生成的地址
	 */
	public static void encode(String content, int width, int height, String srcImagePath, String destImagePath) {
		try {
			// ImageIO.write 参数 1、BufferedImage 2、输出的格式 3、输出的文件
			ImageIO.write(genBarcode(content, width, height, srcImagePath, IMAGE_WIDTH, IMAGE_HEIGHT, IMAGE_HALF_WIDTH,
					FRAME_WIDTH), "jpg", new File(destImagePath));

		} catch (IOException e) {
			e.printStackTrace();
		} catch (WriterException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param content
	 *            二维码显示的文本
	 * @param width
	 *            二维码的宽度
	 * @param height
	 *            二维码的高度
	 * @param srcImagePath
	 *            中间嵌套的图片
	 * @param destImagePath
	 *            二维码生成的地址
	 */
	public static void encode(String content, int width, int height, String destImagePath) {
		try {
			// ImageIO.write 参数 1、BufferedImage 2、输出的格式 3、输出的文件
			ImageIO.write(genBarcode(content, width, height, FRAME_WIDTH), "jpg", new File(destImagePath));
		} catch (IOException e) {
			e.printStackTrace();
		} catch (WriterException e) {
			e.printStackTrace();
		}
	}

	private static BufferedImage genBarcode(String content, int width, int height, int FRAME_WIDTH)
			throws WriterException, IOException {
		// 读取源图像
		Map<EncodeHintType, Object> hint = new HashMap<EncodeHintType, Object>();
		hint.put(EncodeHintType.CHARACTER_SET, "utf-8");
		hint.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);

		// 生成二维码
		BitMatrix matrix = mutiWriter.encode(content, BarcodeFormat.QR_CODE, width, height, hint);
		matrix = updateBit(matrix, 0); // 生成新的bitMatrix，重新设置边框
		// 二维矩阵转为一维像素数组
		int[] pixels = new int[matrix.getWidth() * matrix.getHeight()];
		for (int y = 0; y < matrix.getHeight(); y++) {
			for (int x = 0; x < matrix.getWidth(); x++) {
				// 此处可以修改二维码的颜色，可以分别制定二维码和背景的颜色；
				pixels[y * matrix.getWidth() + x] = matrix.get(x, y) ? 0xff000000 // 0x99562B
						: 0xfffffff; //
			}
		}
		BufferedImage bi = new BufferedImage(matrix.getWidth(), matrix.getHeight(), BufferedImage.TYPE_INT_RGB);
		bi.getRaster().setDataElements(0, 0, matrix.getWidth(), matrix.getWidth(), pixels);
		bi = zoomInImage(bi, width, height);// 根据size放大、缩小生成的二维码
		return bi;
	}

	private static BufferedImage genBarcode(String content, int width, int height, String srcImagePath, int IMAGE_WIDTH,
			int IMAGE_HEIGHT, int IMAGE_HALF_WIDTH, int FRAME_WIDTH) throws WriterException, IOException {
		// 读取源图像
		BufferedImage scaleImage = scale(srcImagePath, IMAGE_WIDTH, IMAGE_HEIGHT, true);
		int[][] srcPixels = new int[IMAGE_WIDTH][IMAGE_HEIGHT];
		for (int i = 0; i < scaleImage.getWidth(); i++) {
			for (int j = 0; j < scaleImage.getHeight(); j++) {
				srcPixels[i][j] = scaleImage.getRGB(i, j);
			}
		}

		Map<EncodeHintType, Object> hint = new HashMap<EncodeHintType, Object>();
		hint.put(EncodeHintType.CHARACTER_SET, "utf-8");
		hint.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);

		// 生成二维码
		BitMatrix matrix = mutiWriter.encode(content, BarcodeFormat.QR_CODE, width, height, hint);
		matrix = updateBit(matrix, 0); // 生成新的bitMatrix，重新设置边框
		// 二维矩阵转为一维像素数组
		int halfW = matrix.getWidth() / 2;
		int halfH = matrix.getHeight() / 2;
		int[] pixels = new int[matrix.getWidth() * matrix.getHeight()];

		for (int y = 0; y < matrix.getHeight(); y++) {
			for (int x = 0; x < matrix.getWidth(); x++) {
				// 读取图片
				if (x > halfW - IMAGE_HALF_WIDTH && x < halfW + IMAGE_HALF_WIDTH && y > halfH - IMAGE_HALF_WIDTH
						&& y < halfH + IMAGE_HALF_WIDTH) {
					pixels[y * matrix.getWidth() + x] = srcPixels[x - halfW + IMAGE_HALF_WIDTH][y - halfH
							+ IMAGE_HALF_WIDTH];
				}
				// 在图片四周形成边框
				else if ((x > halfW - IMAGE_HALF_WIDTH - FRAME_WIDTH && x < halfW - IMAGE_HALF_WIDTH + FRAME_WIDTH
						&& y > halfH - IMAGE_HALF_WIDTH - FRAME_WIDTH && y < halfH + IMAGE_HALF_WIDTH + FRAME_WIDTH)
						|| (x > halfW + IMAGE_HALF_WIDTH - FRAME_WIDTH && x < halfW + IMAGE_HALF_WIDTH + FRAME_WIDTH
								&& y > halfH - IMAGE_HALF_WIDTH - FRAME_WIDTH
								&& y < halfH + IMAGE_HALF_WIDTH + FRAME_WIDTH)
						|| (x > halfW - IMAGE_HALF_WIDTH - FRAME_WIDTH && x < halfW + IMAGE_HALF_WIDTH + FRAME_WIDTH
								&& y > halfH - IMAGE_HALF_WIDTH - FRAME_WIDTH
								&& y < halfH - IMAGE_HALF_WIDTH + FRAME_WIDTH)
						|| (x > halfW - IMAGE_HALF_WIDTH - FRAME_WIDTH && x < halfW + IMAGE_HALF_WIDTH + FRAME_WIDTH
								&& y > halfH + IMAGE_HALF_WIDTH - FRAME_WIDTH
								&& y < halfH + IMAGE_HALF_WIDTH + FRAME_WIDTH)) {
					pixels[y * matrix.getWidth() + x] = 0xfffffff;
				} else {
					// 此处可以修改二维码的颜色，可以分别制定二维码和背景的颜色；
					pixels[y * matrix.getWidth() + x] = matrix.get(x, y) ? 0xff000000 // 0x99562B
							: 0xfffffff; //
				}
			}
		}

		BufferedImage bi = new BufferedImage(matrix.getWidth(), matrix.getHeight(), BufferedImage.TYPE_INT_RGB);
		bi.getRaster().setDataElements(0, 0, matrix.getWidth(), matrix.getWidth(), pixels);
		bi = zoomInImage(bi, width, height);// 根据size放大、缩小生成的二维码
		return bi;
	}

	/**
	 * 把传入的原始图像按高度和宽度进行缩放，生成符合要求的图标
	 * 
	 * @param srcImageFile
	 *            源文件地址
	 * @param height
	 *            目标高度
	 * @param width
	 *            目标宽度
	 * @param hasFiller
	 *            比例不对时是否需要补白：true为补白; false为不补白;
	 * @throws IOException
	 */
	private static BufferedImage scale(String srcImageFile, int height, int width, boolean hasFiller)
			throws IOException {
		double ratio = 0.0; // 缩放比例
		File file = new File(srcImageFile);
		BufferedImage srcImage = ImageIO.read(file);
		Image destImage = srcImage.getScaledInstance(width, height, BufferedImage.SCALE_SMOOTH);
		// 计算比例
		if ((srcImage.getHeight() > height) || (srcImage.getWidth() > width)) {
			if (srcImage.getHeight() > srcImage.getWidth()) {
				ratio = (new Integer(height)).doubleValue() / srcImage.getHeight();
			} else {
				ratio = (new Integer(width)).doubleValue() / srcImage.getWidth();
			}
			AffineTransformOp op = new AffineTransformOp(AffineTransform.getScaleInstance(ratio, ratio), null);
			destImage = op.filter(srcImage, null);
		}
		if (hasFiller) {// 补白
			BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			Graphics2D graphic = image.createGraphics();
			graphic.setColor(Color.white);
			graphic.fillRect(0, 0, width, height);
			if (width == destImage.getWidth(null))
				graphic.drawImage(destImage, 0, (height - destImage.getHeight(null)) / 2, destImage.getWidth(null),
						destImage.getHeight(null), Color.white, null);
			else
				graphic.drawImage(destImage, (width - destImage.getWidth(null)) / 2, 0, destImage.getWidth(null),
						destImage.getHeight(null), Color.white, null);
			graphic.dispose();
			destImage = image;
		}
		return (BufferedImage) destImage;
	}

	/**
	 * @param matrix
	 * @param margin二维码边框
	 * @return
	 */
	private static BitMatrix updateBit(BitMatrix matrix, int margin) {

		int tempM = margin * 2;

		int[] rec = matrix.getEnclosingRectangle(); // 获取二维码图案的属性

		int resWidth = rec[2] + tempM;

		int resHeight = rec[3] + tempM;

		BitMatrix resMatrix = new BitMatrix(resWidth, resHeight); // 按照自定义边框生成新的BitMatrix

		resMatrix.clear();

		for (int i = margin; i < resWidth - margin; i++) { // 循环，将二维码图案绘制到新的bitMatrix中
			for (int j = margin; j < resHeight - margin; j++) {
				if (matrix.get(i - margin + rec[0], j - margin + rec[1])) {
					resMatrix.set(i, j);
				}
			}
		}
		return resMatrix;
	}

	/**
	 * 图片放大缩小
	 */
	public static BufferedImage zoomInImage(BufferedImage originalImage, int width, int height) {

		BufferedImage newImage = new BufferedImage(width, height, originalImage.getType());

		Graphics g = newImage.getGraphics();

		g.drawImage(originalImage, 0, 0, width, height, null);

		g.dispose();

		return newImage;

	}

	public static void main(String[] args) {
		GeneratetwoDimensionalcode.encode("我台,真实反映每时每刻的新闻热点。您....com", 400, 400, "F:\\1.jpg", "F:\\2013-01.jpg");
	}
}
