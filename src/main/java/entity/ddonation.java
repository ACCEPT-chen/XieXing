package entity;

public class ddonation {
    private donation donation;
    private donor donor;

    public ddonation(entity.donation donation, entity.donor donor) {
        this.donation = donation;
        this.donor = donor;
    }

    public entity.donation getDonation() {
        return donation;
    }

    public entity.donor getDonor() {
        return donor;
    }

    public void setDonation(entity.donation donation) {
        this.donation = donation;
    }

    public void setDonor(entity.donor donor) {
        this.donor = donor;
    }
}
