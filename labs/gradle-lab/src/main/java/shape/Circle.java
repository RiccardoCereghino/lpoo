package shape;

public class Circle implements Shape {
	private double radius = 1;
	private final Point center = new Point();


	private Circle(double radius) {
	    // completare
	}

	private Circle(double radius, Point center) {
	    // completare
	}

	public Circle() {
	}

	/*
	 * Factory method
	 */
	public static Circle ofRadius(double radius) {
	    // completare
	}

	/*
	 * Factory method
	 */
	public static Circle ofRadiusCenter(double radius, Point center) {
	    // completare
	}
	
	public void move(double dx, double dy) {
	    // completare
	}

	public void scale(double factor) {		
	    // completare
	}

	public Point getCenter() {
	    // completare
	}

	public double perimeter() {
	    // completare
	}

	public double area() {
	    // completare
	}
}
