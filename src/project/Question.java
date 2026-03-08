

package project;

public class Question {
	String qt,op1,op2,op3,op4,ans,subject;
	public Question(String qt,String op1,String op2,String op3,String op4,String ans,String subject)
	{
		this.qt=qt;
		this.op1=op1;
		this.op2=op2;
		this.op3=op3;
		this.op4=op4;
		this.ans=ans;
		this.subject=subject;
	}
	public String getQT()
	{
		return qt;
	}
	public String getOP1()
	{
		return op1;
	}
	public String getOP2()
	{
		return op2;
	}
	public String getOP3()
	{
		return op3;
	}
	public String getOP4()
	{
		return op4;
	}
	public String getANS()
	{
		return ans;
	}
	public String getSUBJECT()
	{
		return subject;
	}

}