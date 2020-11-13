package Bean;

public class ReportBean {
	String proname,proimage;
	int proId;
	double proprice;
	
	public void setProId(int proId) {this.proId = proId;}
	public void setProname(String proname) {this.proname=proname;}
	public void setProimage(String proimage) {this.proimage=proimage;}
	public void setProprice(Double proprice) {this.proprice=proprice;}
	
	
	public int getProId() {return proId;}
	public String getProname() {return proname;}
	public String getProimage() {return proimage;}
	public Double getProprice() {return proprice;}
	


}
