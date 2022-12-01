package bean;

public class User {
    private String uid;
    private String username;
    private String password;
    private int gender;
    private String nickname;
    private String header;
    public User(){}
    public User(String uid, String username, String password, int gender, String nickname, String header) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.nickname = nickname;
        this.header = header;
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

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

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid='" + uid + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", gender=" + gender +
                ", nickname='" + nickname + '\'' +
                ", header='" + header + '\'' +
                '}';
    }
}
