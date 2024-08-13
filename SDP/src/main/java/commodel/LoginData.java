package commodel;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class LoginData {
	
	@NotNull(message = "Username is required")
	@Size(min=4, max=32,message="Username must be between 4 to 32 characters")
    private String uname;
	
	@NotNull(message ="Password is required")
	@Size(min=6,max=20,message="Password must be between 6 to 20 characters")
    private String pword;

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPword() {
        return pword;
    }

    public void setPword(String pword) {
        this.pword = pword;
    }
}
