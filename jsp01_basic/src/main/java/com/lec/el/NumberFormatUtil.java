package com.lec.el;

import java.text.DecimalFormat;

public class NumberFormatUtil {

	public static String numberFomat(long number, String pattern) {
		DecimalFormat ptrn = new DecimalFormat(pattern);
		return ptrn.format(number);
	}
}
