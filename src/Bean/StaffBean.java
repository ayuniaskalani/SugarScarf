package Bean;

public class StaffBean {

String username,password;
boolean valid=false;

		public void setValid(boolean valid) {this.valid=valid;}
		public void setUser(String username) {this.username=username;}
		public void setPassword(String password) {this.password=password;}

		public boolean isValid() {return valid;}
		public String getUser() {return username;}
		public String getPassword() {return password;}
		
		

}
