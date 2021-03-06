package mop.ERE.HasNext;

import java.util.Random;

public class HasNextTester {

	private Random r = new Random(System.currentTimeMillis());
	HasNextRunner v;
	
	public HasNextTester() {
		v = new HasNextRunner(fillVector(200000), 200000);
	}

	public void runFailure() {
		v.testFailure();
	}

	public void runSuccess() {
		v.testSuccess();
	}

	private Vector<Integer> fillVector(int repetitions) {
		Vector<Integer> v = new Vector<Integer>();
		for (int i = 0; i < repetitions; ++i) {
			v.add(r.nextInt());
		}
		return v;
	}

	public static void main(String[] args) {
		long start = System.currentTimeMillis();
		HasNextTester tester = new HasNextTester();
		tester.runSuccess();
		long end = System.currentTimeMillis();
		System.out.println((end - start));
	}

}
