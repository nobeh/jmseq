package mop;
import mop.*;
import org.apache.commons.collections.map.*;
import java.lang.ref.WeakReference;
import java.util.*;
import java.util.Iterator;

class SimpleLinkedList<T> implements Iterable<T>{
	class Element<T> {

		protected Element(T obj){
			if ((obj != null) && !(obj instanceof String) && !(obj instanceof Integer)) {
				ref = new WeakReference<T>(obj);
			} else {
				this.obj = obj;
			}
		}

		Element<T> next = null;
		WeakReference<T> ref = null;
		T obj = null;

		T get(){
			if(ref != null) {
				if(ref.isEnqueued()) {
					return null;
				} else {
					return ref.get();
				}
			} else {
				return obj;
			}
		}
	}

	private Element<T> head;
	private Element<T> tail;

	public SimpleLinkedList() {
		tail = head = new Element<T>(null);
	}

	public void add(T obj) {
		tail.next = new Element<T>(obj);
		tail = tail.next;
	}

	public Iterator<T> iterator(){
		return new MIterator();
	}

	public boolean isEmpty(){
		return head == tail;
	}

	class MIterator implements Iterator<T> {
		private Element<T> curr;
		private Element<T> pre;

		public MIterator() {
			pre = curr = head;
		}

		public boolean hasNext() {
			return curr.next != null;
		}
		public T next() {
			pre = curr;
			curr = curr.next;
			return (T)(curr.get());
		}
		public void remove() {
			if (pre != curr) {
				if (curr == tail) {
					curr = tail = pre;
				} else {
					pre.next = curr.next;
					curr = pre;
				}
			}
		}
	}
}

class MyStackWrapper {
	public MyStackMonitor_1 monitor = null;
	public long disable = 1;
	public long tau = 1;

	public WeakReference param_ss = null;
}

class MyStackMonitor_1 implements Cloneable {
	public Object clone() {
		try {
			MyStackMonitor_1 ret = (MyStackMonitor_1) super.clone();
			ret.stacks = new ArrayList<IntStack>();
			for(int i = 0; i < this.stacks.size(); i++){
				IntStack stack = this.stacks.get(i);
				ret.stacks.add(stack.fclone());
			}

			return ret;
		}
		catch (CloneNotSupportedException e) {
			throw new InternalError(e.toString());
		}
	}
	/* %%_%_CFG_%_%% */ArrayList<IntStack> stacks = new ArrayList<IntStack>();
	static int[][] gt = { { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, 4, 2,  }, { 0, 4, 2,  }, { 0, -1, -1,  }, { 0, 4, 2,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, -1, -1,  }, { 0, 4, 5,  }, { 0, 7, 3,  }, { 0, -1, -1,  }, { 0, 6, 3,  },  };;
	static int[][][][] at = { { { { 1, 3,  },  }, { { 1, 3,  },  },  }, { { { 1, 2,  },  }, {  },  }, { { { 2, 2,  }, { 10,  },  }, {  },  }, { { { 2, 2,  }, { 10,  },  }, {  },  }, { { { 2, 1,  },  }, {  },  }, { { { 10,  },  }, {  },  }, { { { 2, 1,  },  }, { { 0,  },  },  }, { { { 2, 1,  },  }, { { 11,  },  },  }, { { { 1, 2,  },  }, { { 1, 2,  },  },  }, { { { 10,  },  }, {  },  }, { { { 12,  },  }, { { 1,  },  },  }, { { { 1, 3,  },  }, {  },  }, { { { 12,  },  }, { { 8,  },  },  },  };;
	static boolean[] acc = { true, true, true, true, true, true, true, true, true, false, false, true, false, };;
	int cat; // ACCEPT = 0, UNKNOWN = 1, FAIL = 2
	int event = -1;
	class IntStack implements java.io.Serializable {
		int[] data;
		int curr_index = 0;
		public IntStack(){
			data = new int[32];
		}
		public String toString(){
			String ret = "[";
			for (int i = curr_index; i>=0; i--){
				ret += Integer.toString(data[i])+",";
			}
			return ret+"]";
		}
		public int hashCode() {
			return curr_index^peek();
		}
		public boolean equals(Object o) {
			if (o == null) return false;
			if (!(o instanceof IntStack)) return false;
			IntStack s = (IntStack)o;
			if(curr_index != s.curr_index) return false;
			for(int i = 0; i < curr_index; i++){
				if(data[i] != s.data[i]) return false;
			}
			return true;
		}
		public IntStack(int size){
			data = new int[size];
		}
		public int peek(){
			return data[curr_index - 1];
		}
		public int pop(){
			return data[--curr_index];
		}
		public void pop(int num){
			curr_index -= num;
		}
		public void push(int datum){
			if(curr_index < data.length){
				data[curr_index++] = datum;
			} else{
				int len = data.length;
				int[] old = data;
				data = new int[len * 2];
				for(int i = 0; i < len; ++i){
					data[i] = old[i];
				}
				data[curr_index++] = datum;
			}
		}
		public IntStack fclone(){
			IntStack ret = new IntStack(data.length);
			ret.curr_index = curr_index;
			for(int i = 0; i < curr_index; ++i){
				ret.data[i] = data[i];
			}
			return ret;
		}
		public void clear(){
			curr_index = 0;
		}
	}

	boolean MOP_fail = false;

	public MyStackMonitor_1 () {
		IntStack stack = new IntStack();
		stack.push(-2);
		stack.push(9);
		stacks.add(stack);
	}
	synchronized public final void pu(MyStack ms) {
		event = 1;

		if (cat != 2) {
			event--;
			cat = 1;
			for (int i = stacks.size()-1; i >=0; i--) {
				IntStack stack = stacks.get(i);
				stacks.set(i,null);
				while (stack != null) {
					int s = stack.peek();
					if (s >= 0 && at[s][event].length >= 0) {
						/* not in an error state and something to do? */
						for (int j = 0; j < at[s][event].length; j++) {
							IntStack tstack;
							if (at[s][event].length > 1){
								tstack = stack.fclone();
							} else{
								tstack = stack;
							}
							switch (at[s][event][j].length) {
								case 1:/* Shift */
								tstack.push(at[s][event][j][0]);
								stacks.add(tstack);
								if (acc[at[s][event][j][0]]) cat = 0;
								break;
								case 2: /* Reduce */
								tstack.pop(at[s][event][j][1]);
								int old = tstack.peek();
								tstack.push(gt[old][at[s][event][j][0]]);
								stacks.add(i,tstack);
								break;
							}
						}
					}
					stack = stacks.get(i);
					stacks.remove(i);
				}
			}
			if (stacks.isEmpty())
			cat = 2;
		}

		MOP_fail = cat == 2
		;
	}
	synchronized public final void po(MyStack ms) {
		event = 2;

		if (cat != 2) {
			event--;
			cat = 1;
			for (int i = stacks.size()-1; i >=0; i--) {
				IntStack stack = stacks.get(i);
				stacks.set(i,null);
				while (stack != null) {
					int s = stack.peek();
					if (s >= 0 && at[s][event].length >= 0) {
						/* not in an error state and something to do? */
						for (int j = 0; j < at[s][event].length; j++) {
							IntStack tstack;
							if (at[s][event].length > 1){
								tstack = stack.fclone();
							} else{
								tstack = stack;
							}
							switch (at[s][event][j].length) {
								case 1:/* Shift */
								tstack.push(at[s][event][j][0]);
								stacks.add(tstack);
								if (acc[at[s][event][j][0]]) cat = 0;
								break;
								case 2: /* Reduce */
								tstack.pop(at[s][event][j][1]);
								int old = tstack.peek();
								tstack.push(gt[old][at[s][event][j][0]]);
								stacks.add(i,tstack);
								break;
							}
						}
					}
					stack = stacks.get(i);
					stacks.remove(i);
				}
			}
			if (stacks.isEmpty())
			cat = 2;
		}

		MOP_fail = cat == 2
		;
	}
	synchronized public final boolean MOP_fail() {
		return MOP_fail;
	}
	synchronized public final void reset() {
		stacks.clear();
		IntStack stack = new IntStack();
		stack.push(-2);
		stack.push(9);
		stacks.add(stack);
		MOP_fail = false;
	}
	public final int hashCode(){
		if(stacks.size() == 0) return 0;
		return stacks.size() ^ stacks.get(stacks.size() - 1).hashCode();
	}
	public final boolean equals(Object o){
		if(o == null) return false;
		if(! (o instanceof MyStackMonitor_1)) return false ;
		MyStackMonitor_1 m = (MyStackMonitor_1) o;
		if (stacks.size() != m.stacks.size()) return false;
		for(int i = 0; i < stacks.size(); i++){
			IntStack stack = stacks.get(i);
			IntStack stack2 = m.stacks.get(i);
			if(stack.curr_index != stack2.curr_index) return false;
			for(int j = 0; j < stack.curr_index; j++){
				if(stack.data[j] != stack2.data[j]) return false;
			}
		}
		return true;

	}
}

public aspect StackMonitorAspect {
	static Map makeMap(Object key){
		if (key instanceof String) {
			return new HashMap();
		} else {
			return new ReferenceIdentityMap(AbstractReferenceMap.WEAK, AbstractReferenceMap.HARD, true);
		}
	}
	static List makeList(){
		return new ArrayList();
	}

	static Map indexing_lock = new HashMap();

	static Map makeMap(){
		return new ReferenceIdentityMap(AbstractReferenceMap.WEAK, AbstractReferenceMap.HARD, true);
	}
	static SimpleLinkedList makeLinkedList(){
		return new SimpleLinkedList();
	}

	static long timestamp = 1;

	static MyStackWrapper MyStack_rootWrapper = new MyStackWrapper();
	static SimpleLinkedList<MyStackWrapper> MyStack_List = makeLinkedList();

	public StackMonitorAspect() {
	}

	pointcut MyStack_pu1(MyStack ms) : (call(* MyStack.push(..)) && target(ms)) && !within(MyStackMonitor_1) && !within(MyStackWrapper) && !within(StackMonitorAspect) && !within(SimpleLinkedList) && !adviceexecution();
	before (MyStack ms) : MyStack_pu1(ms) {
		boolean skipAroundAdvice = false;
		Object obj = null;
		Map m;
		SimpleLinkedList<MyStackWrapper> tempList;
		MyStackWrapper mainWrapper;
		MyStackWrapper uWrapper;
		MyStackWrapper pWrapper;
		MyStackWrapper monitorWrapper;
		Map mainMap;
		Map lastMap;
		SimpleLinkedList<MyStackWrapper> uWList;

		mainWrapper = (MyStackWrapper) MyStack_rootWrapper;

		if (mainWrapper == null || mainWrapper.monitor == null) {

			if(mainWrapper == null) {
				MyStack_rootWrapper = mainWrapper = new MyStackWrapper();
			}
			if(mainWrapper.monitor == null) {
				mainWrapper.monitor = new MyStackMonitor_1();
				mainWrapper.tau = this.timestamp++;
				uWList = MyStack_List;

				uWList.add(mainWrapper);

			}

			mainWrapper.disable = this.timestamp++;
		}
		uWList = MyStack_List;

		if(uWList != null) {
			Iterator it = uWList.iterator();
			while(it.hasNext()) {
				monitorWrapper = (MyStackWrapper)it.next();
				if(monitorWrapper == null) {
					it.remove();
				} else {
					monitorWrapper.monitor.pu(ms);
					if(monitorWrapper.monitor.MOP_fail()) {
						System.out.println("failed");
						monitorWrapper.monitor.reset();
					}

				}
			}
		}
	}

	pointcut MyStack_po1(MyStack ms) : (call(* MyStack.pop()) && target(ms)) && !within(MyStackMonitor_1) && !within(MyStackWrapper) && !within(StackMonitorAspect) && !within(SimpleLinkedList) && !adviceexecution();
	before (MyStack ms) : MyStack_po1(ms) {
		boolean skipAroundAdvice = false;
		Object obj = null;
		Map m;
		SimpleLinkedList<MyStackWrapper> tempList;
		MyStackWrapper mainWrapper;
		MyStackWrapper uWrapper;
		MyStackWrapper pWrapper;
		MyStackWrapper monitorWrapper;
		Map mainMap;
		Map lastMap;
		SimpleLinkedList<MyStackWrapper> uWList;

		mainWrapper = (MyStackWrapper) MyStack_rootWrapper;

		if (mainWrapper == null || mainWrapper.monitor == null) {

			if(mainWrapper == null) {
				MyStack_rootWrapper = mainWrapper = new MyStackWrapper();
			}
			if(mainWrapper.monitor == null) {
				mainWrapper.monitor = new MyStackMonitor_1();
				mainWrapper.tau = this.timestamp++;
				uWList = MyStack_List;

				uWList.add(mainWrapper);

			}

			mainWrapper.disable = this.timestamp++;
		}
		uWList = MyStack_List;

		if(uWList != null) {
			Iterator it = uWList.iterator();
			while(it.hasNext()) {
				monitorWrapper = (MyStackWrapper)it.next();
				if(monitorWrapper == null) {
					it.remove();
				} else {
					monitorWrapper.monitor.po(ms);
					if(monitorWrapper.monitor.MOP_fail()) {
						System.out.println("failed");
						monitorWrapper.monitor.reset();
					}

				}
			}
		}
	}

}

