package com.ict.common;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class FileRename {
	public String exec(String path, String fname) {
		File dir = new File(path);
		String[] arr = dir.list();
		
		// 諛곗뿴�쓣 list濡� 蹂��솚ㅇㄴㅇㅁ

		List<String> k = Arrays.asList(arr);
		Boolean result = k.contains(fname);
		if(result) {
			// 00000.xxx
			String[] names = fname.split("\\.");
			fname = names[0] + "1." + names[1];
		}
		return fname;
	}
}
