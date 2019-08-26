package meterReading.entity;

public class Collect {
    private String name;
    private int building;
    private String door;
    private double display;

    public Collect(){}

    public Collect(String name, int building, String door, double display) {
        this.name = name;
        this.building = building;
        this.door = door;
        this.display = display;
    }

    public int getBuilding() {
        return building;
    }

    public void setBuilding(int building) {
        this.building = building;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDoor() {
        return door;
    }

    public void setDoor(String door) {
        this.door = door;
    }

    public double getDisplay() {
        return display;
    }

    public void setDisplay(double display) {
        this.display = display;
    }
}
