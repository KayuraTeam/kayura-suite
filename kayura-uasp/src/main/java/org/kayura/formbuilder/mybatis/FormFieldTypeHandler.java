/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.formbuilder.mybatis;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.kayura.formbuilder.converter.FormJsonConverterUtil;
import org.kayura.formbuilder.model.FormField;
import org.kayura.formbuilder.model.FormFieldList;
import org.kayura.formbuilder.model.field.TableField;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author liangxia@live.com
 */
public class FormFieldTypeHandler extends BaseTypeHandler<FormFieldList> {

	static ObjectMapper objectMapper = new ObjectMapper();

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, FormFieldList parameter, JdbcType jdbcType)
			throws SQLException {
		String s;
		try {
			s = objectMapper.writeValueAsString(parameter);
			ps.setString(i, s);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}

	private FormFieldList getJsonObject(String json) {

		FormFieldList fields = null;
		try {
			if (json != null && json != "") {
				JsonNode modelNode = objectMapper.readTree(json);
				fields = convertToModel(modelNode);
			}
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fields;
	}

	@Override
	public FormFieldList getNullableResult(ResultSet rs, String columnName) throws SQLException {

		String json = rs.getString(columnName);
		return getJsonObject(json);
	}

	@Override
	public FormFieldList getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		String json = rs.getString(columnIndex);
		return getJsonObject(json);
	}

	@Override
	public FormFieldList getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		String json = cs.getString(columnIndex);
		return getJsonObject(json);
	}

	/**
	 * 因为数据库存储的模型值为JSON,无法自动转成对象.
	 * 
	 */
	static FormFieldList convertToModel(JsonNode modelNode) {

		FormFieldList fields = new FormFieldList();

		for (JsonNode fieldNode : modelNode) {

			String fieldType = FormJsonConverterUtil.getValueAsString("fieldType", fieldNode);
			if (FormField.TYPE_TABLE.equalsIgnoreCase(fieldType)) {

				TableField tableField = new TableField();
				List<JsonNode> children = fieldNode.findValues("children");
				for (JsonNode c : children) {
					Class<?> type = findFieldType(fieldType);
					if (type != null) {
						try {
							FormField formField = (FormField) objectMapper.readValue(c.toString(), type);
							tableField.addChildren(formField);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}

				fields.add(tableField);
			} else {

				Class<?> type = findFieldType(fieldType);
				if (type != null) {
					try {
						FormField formField = (FormField) objectMapper.readValue(fieldNode.toString(), type);
						fields.add(formField);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}

		return fields;
	}

	static Class<?> findFieldType(String fieldType) {

		Class<?> type = null;

		if (FormField.FIELD_TYPES.containsKey(fieldType)) {
			type = FormField.FIELD_TYPES.get(fieldType);
		}

		return type;
	}

}
