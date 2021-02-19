package entity;

public class shopping {
    private String id;
    private String donationid;
    private String donoremail;
    private String doneeemail;
    private String phone;
    private String address;
    private String time;

    public shopping(String id, String donationid, String donoremail, String doneeemail, String phone, String address, String time) {
        this.id = id;
        this.donationid = donationid;
        this.donoremail = donoremail;
        this.doneeemail = doneeemail;
        this.phone = phone;
        this.address = address;
        this.time = time;
    }

    public String getId() {
        return id;
    }

    public String getDonationid() {
        return donationid;
    }

    public String getDonoremail() {
        return donoremail;
    }

    public String getDoneeemail() {
        return doneeemail;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public String getTime() {
        return time;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setDonationid(String donationid) {
        this.donationid = donationid;
    }

    public void setDonoremail(String donoremail) {
        this.donoremail = donoremail;
    }

    public void setDoneeemail(String doneeemail) {
        this.doneeemail = doneeemail;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
