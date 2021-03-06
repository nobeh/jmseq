package nl.liacs.jmseq.verify.callexpression;

import java.lang.reflect.Method;
import java.util.LinkedList;
import java.util.List;

/**
 * 
 * @author Behrooz Nobakht
 * 
 */
public class BaseCallExpression implements CallExpression {

	protected String originalExpression;
	protected Occurrence occurrence = Occurrence.Once;
	protected CallExpression outerCallExpression = null;
	protected List<CallExpression> innerCallExpressions;
	protected List<CallExpression> siblingCallExpressions;
	private Method method;

	public BaseCallExpression() {
	}

	protected BaseCallExpression(Method method) {
		this.method = method;
	}

	@Override
	public String getExpression() {
		return this.originalExpression;
	}

	@Override
	public void setReocurrence(Occurrence occurrence) {
		this.occurrence = occurrence;
	}

	@Override
	public Occurrence getOccurrence() {
		return this.occurrence;
	}

	@Override
	public List<CallExpression> getInnerCallExpressions() {
		if (innerCallExpressions == null) {
			innerCallExpressions = new LinkedList<>();
		}
		return this.innerCallExpressions;
	}

	@Override
	public CallExpression getOuterCallExpression() {
		return this.outerCallExpression;
	}

	@Override
	public void setOuterCallExpression(CallExpression expression) {
		this.outerCallExpression = expression;
	}

	@Override
	public List<CallExpression> getSiblingCallExpressions() {
		if (siblingCallExpressions == null) {
			siblingCallExpressions = new LinkedList<>();
		}
		return this.siblingCallExpressions;
	}
	
	@Override
	public Method getMethod() {
		return method;
	}

	public String toString(String tab) {
		StringBuffer sb = new StringBuffer(tab + "{\n");
		sb.append(tab + originalExpression);
		sb.append(" : " + this.occurrence);
		if (!this.innerCallExpressions.isEmpty()) {
			sb.append(tab + "\n" + tab + "\tInner Calls:" + "\n");
			for (CallExpression ce : this.innerCallExpressions) {
				sb.append(ce.toString(tab + "\t"));
			}
		}
		if (!this.siblingCallExpressions.isEmpty()) {
			sb.append(tab + "\n" + tab + "\tSibling Calls:" + "\n");
			for (CallExpression ce : this.siblingCallExpressions) {
				sb.append(ce.toString(tab + "\t"));
			}
		}
		sb.append("\n" + tab + "}\n");
		return sb.toString();
	}

	@Override
	public String toString() {
		return toString("");
	}

	@Override
	public int hashCode() {
		return this.originalExpression.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (null == obj) {
			return false;
		}
		if (!(obj instanceof CallExpression)) {
			return false;
		}
		return hashCode() == obj.hashCode();
	}

}
