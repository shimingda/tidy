> Builder模式既有良好的可读性，还有健壮的灵活性

```
public class User {
    private String username;
    private String password;
 
    public String getUsername() {
        return username;
    }
 
    public void setUsername(String username) {
        this.username = username;
    }
 
    public String getPassword() {
        return password;
    }
 
    public void setPassword(String password) {
        this.password = password;
    }
 
    public static Builder builder() {
        return new Builder();
    }
 
    private User(Builder builder) {
        this.username = builder.username;
        this.password = builder.password;
    }
     public static class Builder {
        private String username;
        private String password;
 
        public Builder setUserName(String username) {
            this.username = username;
            return this;
        }
        public Builder setPassword(String password){
            this.password=password;
            return this;
        }
        public User build() {
            return new User(this);
        }
 
        @Override
        public String toString() {
            return "Builder{" +
                    "username='" + username + '\'' +
                    ", password='" + password + '\'' +
                    '}';
        }
    }
    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

```