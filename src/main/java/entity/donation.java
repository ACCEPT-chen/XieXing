package entity;

public class donation {
    private String id;
    private String name;
    private String size;
    private String type;
    private String photo;
    private String sex;
    private String useremail;
    private String cond;

    public donation(String id, String name, String size, String type, String photo, String sex, String useremail, String cond) {
        this.id = id;
        this.name = name;
        this.size = size;
        this.type = type;
        this.photo = photo;
        this.sex = sex;
        this.useremail = useremail;
        this.cond = cond;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getSize() {
        return size;
    }

    public String getType() {
        return type;
    }

    public String getPhoto() {
        return photo;
    }

    public String getSex() {
        return sex;
    }

    public String getUseremail() {
        return useremail;
    }

    public String getCond() {
        return cond;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setUseremail(String useremail) {
        this.useremail = useremail;
    }

    public void setCond(String cond) {
        this.cond = cond;
    }
}
