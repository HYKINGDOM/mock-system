package com.scs.common.utils.date;

import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.datatype.jsr310.PackageVersion;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateDeserializer;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalTimeSerializer;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

/**
 * java 8 时间默认序列化
 *
 * @author admin
 */
public class MicaJavaTimeModule extends SimpleModule {

	public MicaJavaTimeModule() {
		super(PackageVersion.VERSION);
		this.addDeserializer(LocalDateTime.class, new LocalDateTimeDeserializer(DateUtil.DATETIME_FORMATTER));
		this.addDeserializer(LocalDate.class, new LocalDateDeserializer(DateUtil.DATE_FORMATTER));
		this.addDeserializer(LocalTime.class, new LocalTimeDeserializer(DateUtil.TIME_FORMATTER));
		this.addSerializer(LocalDateTime.class, new LocalDateTimeSerializer(DateUtil.DATETIME_FORMATTER));
		this.addSerializer(LocalDate.class, new LocalDateSerializer(DateUtil.DATE_FORMATTER));
		this.addSerializer(LocalTime.class, new LocalTimeSerializer(DateUtil.TIME_FORMATTER));
	}
}
