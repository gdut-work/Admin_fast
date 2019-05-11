package com.chenwt.component.thymeleaf;

import com.chenwt.component.thymeleaf.attribute.SelectDictAttrProcessor;
import com.chenwt.component.thymeleaf.attribute.SelectListAttrProcessor;
import org.thymeleaf.dialect.AbstractProcessorDialect;
import org.thymeleaf.dialect.IExpressionObjectDialect;
import org.thymeleaf.expression.IExpressionObjectFactory;
import org.thymeleaf.processor.IProcessor;
import org.thymeleaf.standard.StandardDialect;
import org.thymeleaf.templatemode.TemplateMode;

import java.util.LinkedHashSet;
import java.util.Set;

/**
 * @author chenwt
 * @date 2018/8/14
 */
public class AdminDialect extends AbstractProcessorDialect implements IExpressionObjectDialect {

    private static final String NAME = "AdminDialect";
    private static final String PREFIX = "mo";
    private IExpressionObjectFactory expressionObjectFactory = null;

    public AdminDialect() {
        super(NAME, PREFIX, StandardDialect.PROCESSOR_PRECEDENCE);
    }

    @Override
    public Set<IProcessor> getProcessors(String dialectPrefix) {
        LinkedHashSet processors = new LinkedHashSet();
        processors.add(new SelectDictAttrProcessor(TemplateMode.HTML, dialectPrefix));
        processors.add(new SelectListAttrProcessor(TemplateMode.HTML, dialectPrefix));
        return processors;
    }

    @Override
    public IExpressionObjectFactory getExpressionObjectFactory() {
        if (this.expressionObjectFactory == null) {
            this.expressionObjectFactory = new AdminExpressionObjectFactory();
        }
        return this.expressionObjectFactory;
    }
}
