package org.kayura.formbuilder.test;

import org.junit.Test;
import org.kayura.formbuilder.converter.FormJsonConverter;
import org.kayura.formbuilder.model.FormModel;
import org.kayura.utils.KeyUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class FormJsonConverterTest {

	protected void jsonConvertTest(String rawJson) {

		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonNode;
		try {
			jsonNode = objectMapper.readTree(rawJson);

			FormJsonConverter jsonConverter = new FormJsonConverter();
			FormModel formModel = jsonConverter.convertToModel(jsonNode);
			formModel.setModelId(KeyUtils.newId());
			formModel.setCreator("xialiang");
			formModel.setTitle("测试表单模型");

			System.out.println(objectMapper.writeValueAsString(formModel));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void textFieldJsonConvertTest() throws Exception {

		String rawJson = "{\"fields\":[{\"label\":\"你的姓名\",\"field_type\":\"text\",\"required\":true,\"field_options\":{\"minlength\":\"2\",\"length_units\":\"words\",\"maxlength\":\"32\"},\"cid\":\"c8\",\"name\":\"name\",\"description\":\"请输入您的真实姓名\",\"placeholder\":\"此处输入姓名\"}]}";
		jsonConvertTest(rawJson);
	}

	@Test
	public void textAreaFieldJsonConvert() throws Exception {

		String rawJson = "{\"fields\":[{\"label\":\"多行文本\",\"field_type\":\"textarea\",\"required\":true,\"field_options\":{\"minlength\":\"10\",\"maxlength\":\"100\",\"length_units\":\"words\"},\"cid\":\"c26\",\"name\":\"remark\",\"description\":\"多行文本的描述\",\"placeholder\":\"此处输入多行文本\"}]}";
		jsonConvertTest(rawJson);
	}

	@Test
	public void numberFieldJsonConvertTest() throws Exception {

		String rawJson = "{\"fields\":[{\"label\":\"数字\",\"field_type\":\"number\",\"required\":true,\"field_options\":{\"min\":\"1\",\"max\":\"200\",\"units\":\"公斤\",\"integer_only\":false},\"cid\":\"c59\",\"name\":\"amount\",\"description\":\"请输入数量\"}]}";
		jsonConvertTest(rawJson);
	}

	@Test
	public void moneyFieldJsonConvertTest() throws Exception {

		String rawJson = "{\"fields\":[{\"label\":\"金额\",\"field_type\":\"money\",\"required\":true,\"field_options\":{\"units\":\"元\"},\"cid\":\"c68\",\"name\":\"money\",\"description\":\"请输入金额\"}]}";
		jsonConvertTest(rawJson);
	}

	@Test
	public void selectFieldJsonConvertTest() throws Exception {

		String rawJson = "{\"fields\":[{\"label\":\"你的爱好\",\"field_type\":\"select\",\"required\":true,\"field_options\":{\"options\":[{\"label\":\"选项一\",\"checked\":true},{\"label\":\"选项二\",\"checked\":false}]},\"cid\":\"c9\",\"name\":\"interest\",\"description\":\"请选择你的兴趣爱好.\"}]}";
		jsonConvertTest(rawJson);
	}

	@Test
	public void multiSelectFieldJsonConvertTest() throws Exception {

		String rawJson = "{\"fields\":[{\"label\":\"你的爱好\",\"field_type\":\"multiselect\",\"required\":true,\"field_options\":{\"options\":[{\"label\":\"选项一\",\"checked\":true},{\"label\":\"选项二\",\"checked\":false}]},\"cid\":\"c9\",\"name\":\"interest\",\"description\":\"请选择你的兴趣爱好.\"}]}";
		jsonConvertTest(rawJson);
	}

	@Test
	public void dateFieldJsonConvertTest() throws Exception {

		String rawJson = "{\"fields\":[{\"label\":\"开始时间\",\"field_type\":\"date\",\"required\":false,\"field_options\":{\"format\":\"yyyy-MM-dd\"},\"cid\":\"c5\",\"name\":\"startTime\",\"description\":\"请选择开始时间\"}]}";
		jsonConvertTest(rawJson);
	}

	@Test
	public void dateRangeFieldJsonConvertTest() throws Exception {

		String rawJson = "{\"fields\":[{\"label\":\"字段标题\",\"field_type\":\"daterange\",\"required\":true,\"field_options\":{\"start_label\":\"开始日期\",\"end_label\":\"结束日期\",\"format\":\"yyyy-MM-dd\"},\"cid\":\"c17\",\"name\":\"字段名\",\"description\":\"字段描述\"}]}";
		jsonConvertTest(rawJson);
	}

	@Test
	public void photoFieldJsonConvertTest() {

		String rawJson = "{\"fields\":[{\"label\":\"图片\",\"field_type\":\"photo\",\"required\":false,\"field_options\":{},\"cid\":\"c21\",\"name\":\"photo\",\"description\":\"请选择图片\"}]}";
		jsonConvertTest(rawJson);
	}

	@Test
	public void attachmentFieldJsonConvertTest() {

		String rawJson = "{\"fields\":[{\"label\":\"附件\",\"field_type\":\"attachment\",\"required\":false,\"field_options\":{},\"cid\":\"c37\",\"name\":\"字段名\",\"description\":\"描述\"}]}";
		jsonConvertTest(rawJson);
	}

	@Test
	public void tableFieldJsonConvertTest() {

		String rawJson = "{\"fields\":[{\"label\":\"妮称\",\"field_type\":\"text\",\"required\":false,\"field_options\":{\"minlength\":\"10\",\"maxlength\":\"200\",\"length_units\":\"words\"},\"cid\":\"c17\",\"name\":\"nick\",\"description\":\"请输入您的妮称\",\"placeholder\":\"此输入\"},{\"label\":\"清单明细项\",\"field_type\":\"table-begin\",\"required\":false,\"field_options\":{},\"cid\":\"c9\",\"description\":\"清单明细项\"},{\"label\":\"物品名称\",\"field_type\":\"text\",\"required\":false,\"field_options\":{},\"cid\":\"c22\",\"name\":\"wpm\",\"placeholder\":\"此处输入物品名\"},{\"label\":\"物品数量\",\"field_type\":\"number\",\"required\":false,\"field_options\":{\"units\":\"件\",\"min\":\"0\",\"max\":\"100\"},\"cid\":\"c49\",\"name\":\"wpl\"},{\"label\":\"\",\"field_type\":\"table-end\",\"required\":false,\"field_options\":{\"action_name\":\"添加新项\"},\"cid\":\"c5\"},{\"label\":\"备注\",\"field_type\":\"textarea\",\"required\":false,\"field_options\":{\"minlength\":\"0\",\"maxlength\":\"512\",\"length_units\":\"words\"},\"cid\":\"c30\",\"name\":\"remark\",\"description\":\"有些其它要说的吗\",\"placeholder\":\"输入备注信息\"}]}";
		jsonConvertTest(rawJson);
	}
}
