package org.kayura.activiti.spring;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.activiti.engine.ProcessEngineConfiguration;
import org.activiti.engine.delegate.VariableScope;
import org.activiti.engine.impl.cfg.ProcessEngineConfigurationImpl;
import org.activiti.engine.impl.el.ExpressionManager;
import org.activiti.engine.impl.el.ReadOnlyMapELResolver;
import org.activiti.engine.impl.el.VariableScopeElResolver;
import org.activiti.engine.impl.javax.el.ArrayELResolver;
import org.activiti.engine.impl.javax.el.BeanELResolver;
import org.activiti.engine.impl.javax.el.CompositeELResolver;
import org.activiti.engine.impl.javax.el.ELResolver;
import org.activiti.engine.impl.javax.el.JsonNodeELResolver;
import org.activiti.engine.impl.javax.el.ListELResolver;
import org.activiti.engine.impl.javax.el.MapELResolver;
import org.activiti.spring.ApplicationContextElResolver;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class SpringExpressionManager extends ExpressionManager implements ApplicationContextAware {

	private List<ELResolver> customResolvers = new ArrayList<ELResolver>();
	private ApplicationContext applicationContext;

	public SpringExpressionManager() {
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
	}

	public void setProcessEngineConfiguration(ProcessEngineConfiguration processEngineConfiguration) {
		this.setBeans(((ProcessEngineConfigurationImpl) processEngineConfiguration).getBeans());
	}

	public void setCustomResolvers(List<ELResolver> customResolvers) {
		this.customResolvers = customResolvers;
	}

	public SpringExpressionManager(ApplicationContext applicationContext, Map<Object, Object> beans) {
		super(beans);
		this.applicationContext = applicationContext;
	}

	@Override
	protected ELResolver createElResolver(VariableScope variableScope) {
		CompositeELResolver compositeElResolver = new CompositeELResolver();
		compositeElResolver.add(new VariableScopeElResolver(variableScope));

		if (beans != null) {
			compositeElResolver.add(new ReadOnlyMapELResolver(beans));
		} else {
			compositeElResolver.add(new ApplicationContextElResolver(applicationContext));
		}

		compositeElResolver.add(new ArrayELResolver());
		compositeElResolver.add(new ListELResolver());
		compositeElResolver.add(new MapELResolver());
		compositeElResolver.add(new JsonNodeELResolver());
		compositeElResolver.add(new BeanELResolver());

		if (customResolvers != null) {
			for (ELResolver resolver : customResolvers) {
				compositeElResolver.add(resolver);
			}
		}

		return compositeElResolver;
	}

}
