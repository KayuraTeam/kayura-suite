package org.kayura.activiti.bpmn.handler;

import java.io.Serializable;

import org.activiti.engine.delegate.Expression;
import org.activiti.engine.delegate.VariableScope;
import org.kayura.activiti.bpmn.model.ExtendProperty;

public class ExtendPropertyHandler implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;
	protected String name;
	protected String type;
	private Expression expression;
	protected String value;

	public ExtendProperty createExtendProperty(VariableScope variableScope) {

		ExtendProperty extendProperty = new ExtendProperty(this);
		Object modelValue = null;

		if (variableScope != null) {
			if (expression != null) {
				final String varName = id;
				if (variableScope.hasVariable(varName)) {
					modelValue = variableScope.getVariable(varName);
				}
			} else {
				modelValue = expression.getValue(variableScope);
			}
		}

		if (modelValue instanceof String) {
			extendProperty.setValue((String) modelValue);
		} else if (modelValue != null) {
			extendProperty.setValue(modelValue.toString());
		} else {
			extendProperty.setValue(this.value);
		}

		return extendProperty;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Expression getExpression() {
		return expression;
	}

	public void setExpression(Expression expression) {
		this.expression = expression;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
