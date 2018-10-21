package cn.edu.hbpu.animation.util;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import cn.edu.hbpu.animation.pojo.News;
import cn.edu.hbpu.animation.pojo.Video;

public class CommonUtils {

	public static String getUUID() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	public static String path = "E:\\dev\\upload\\";

	public static void uploadFiles(News news, MultipartFile[] files) {
		String picNames = "";
		for (int i = 0; i < files.length; i++) {
			if (files[i] != null) {
				String picName = getUUID();
				String filename = files[i].getOriginalFilename();
				String extname = filename.substring(filename.indexOf("."));

				try {
					files[i].transferTo(new File(path + picName + extname));
				} catch (Exception e) {
					e.printStackTrace();
				}
				picNames += picName + extname + ",";
			}
		}
		news.setPictures(picNames.substring(0, picNames.length() - 1));

	}
	
	public static void uploadFiles(Video video, MultipartFile[] files) {
		String picNames = "";
		for (int i = 0; i < files.length; i++) {
			if (files[i] != null) {
				String picName = getUUID();
				String filename = files[i].getOriginalFilename();
				String extname = filename.substring(filename.indexOf("."));

				try {
					files[i].transferTo(new File(path + picName + extname));
				} catch (Exception e) {
					e.printStackTrace();
				}
				picNames += picName + extname + ",";
			}
		}
		video.setPicture(picNames.substring(0, picNames.length() - 1));

	}

}
