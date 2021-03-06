package project.common;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

@Component("fileUtils")
public class FileUtils {

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	public List<Map> saveFile(int index, List<MultipartFile> files, String requestPath) throws IOException {

		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map> list = new ArrayList<Map>();
		Map listMap = null;

		String imagePath = "/resources/img/";
		String savePath = requestPath + imagePath;

		File file = new File(savePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		for (MultipartFile m : files) {
			originalFileName = m.getOriginalFilename();
			originalFileExtension = m.getOriginalFilename().substring(originalFileName.lastIndexOf("."));
			storedFileName = getRandomString() + originalFileExtension;

			file = new File(savePath + storedFileName);

			m.transferTo(file);

			listMap = new HashMap();
			listMap.put("groupNum", index);
			listMap.put("originalFileName", originalFileName);
			listMap.put("storedFileName", storedFileName);
			listMap.put("fileSize", m.getSize());
			list.add(listMap);
		}
		return list;
	}

	public Map saveSingleFile(int index, MultipartFile fileP, String requestPath) throws IOException {

		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		Map map = null;

		String imagePath = "/resources/img/";
		String savePath = requestPath + imagePath;

		File file = new File(savePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		originalFileName = fileP.getOriginalFilename();
		originalFileExtension = fileP.getOriginalFilename().substring(originalFileName.lastIndexOf("."));
		storedFileName = getRandomString() + originalFileExtension;

		file = new File(savePath + storedFileName);
		System.out.println(file.getAbsolutePath()); // 파일 절대 경로

		fileP.transferTo(file);

		map = new HashMap();
		map.put("userNum", index);
		map.put("originalFileName", originalFileName);
		map.put("storedFileName", storedFileName);
		map.put("fileSize", map.get("Size"));

		System.out.println(map);
		return map;
	}

//	public List<Map> saveCKFile(int index, List<MultipartFile> files, String requestPath) throws IOException {
//
//		String originalFileName = null;
//		String originalFileExtension = null;
//		String storedFileName = null;
//
//		List<Map> list = new ArrayList<Map>();
//		Map listMap = null;
//
//		String imagePath = "/resources/ckstorage/images/";
//		String savePath = requestPath + imagePath;
//
//		File file = new File(savePath);
//		if (file.exists() == false) {
//			file.mkdirs();
//		}
//
//		for (MultipartFile m : files) {
//			originalFileName = m.getOriginalFilename();
//			originalFileExtension = m.getOriginalFilename().substring(originalFileName.lastIndexOf("."));
//			storedFileName = getRandomString() + originalFileExtension;
//
//			file = new File(savePath + storedFileName);
//			System.out.println(file.getAbsolutePath()); // 파일 절대 경로
//
//			m.transferTo(file);
//
//			listMap = new HashMap();
//			listMap.put("groupNum", index);
//			listMap.put("originalFileName", originalFileName);
//			listMap.put("storedFileName", storedFileName);
//			listMap.put("fileSize", m.getSize());
//			list.add(listMap);
//		}
//		System.out.println(list.toString());
//		return list;
//	}
}

