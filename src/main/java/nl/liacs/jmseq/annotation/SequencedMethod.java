/*
 * Created on Mar 15, 2010 - 10:46:09 PM
 */
package nl.liacs.jmseq.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import nl.liacs.jmseq.verify.failurehandler.SequentialMetadataVerificationFailureHandler;
import nl.liacs.jmseq.verify.failurehandler.VerificationFailureHandler;

/**
 * An annotation that is be used for methods require runtime monitoring. The
 * method {@link #value()} is the main property of this annotation to specify
 * the requirements of a sequential execution.
 * 
 * 
 * @author Behrooz Nobakht [behrooz dot nobakht at gmail dot com]
 * @see SequencedObject
 * @see VerificationFailureHandler
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface SequencedMethod {

	/**
	 * Specifies the sequential execution requirements of the method.
	 * 
	 * @return The string of specification.
	 */
	String value();

	/**
	 * A subclass of {@link VerificationFailureHandler} to handle the situation
	 * when the execution has failed under the specification of this annotation.
	 * 
	 * @return A {@link Class} literal of the implementing class for
	 *         verification failure handling.
	 * @see VerificationFailureHandler
	 */
	Class<?> verificationFailureHandler() default SequentialMetadataVerificationFailureHandler.class;

}
