package meterReading.entity;

public class MeterType {
    private String meterId;
    private int type;

    public MeterType(){}
    public MeterType(String meterId,int type){
        this.meterId = meterId;
        this.type = type;
    }

    public String getMeterId() {
        return meterId;
    }

    public void setMeterId(String meterId) {
        this.meterId = meterId;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
