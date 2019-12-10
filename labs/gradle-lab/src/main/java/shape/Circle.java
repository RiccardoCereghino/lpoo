package shape;

public class Circle implements Shape {
	private double radius = 1;
	private final Point center = new Point();


	private Circle(double radius) {
    this.radius = radius;
    this.center.move(0, 0);
	}

	private Circle(double radius, Point center) {
    this.radius = radius;
    this.center.move(center.getX(), center.getY());
	}

	public Circle() {
    this.center.move(0, 0);
	}

	/*
	 * Factory method
	 */
	public static Circle ofRadius(double radius) {
    return new Circle(radius);
	}

	/*
	 * Factory method
	 */
	public static Circle ofRadiusCenter(double radius, Point center) {
    return new Circle(radius, center);
	}
	
	public void move(double dx, double dy) {
    this.center.move(dx, dy);
	}

	public void scale(double factor) {
    this.radius = this.radius * factor;
	}

	public Point getCenter() {
    return this.center;
	}

	public double perimeter() {
    return this.radius * 3.14 * 2;
	}

	public double area() {
    return this.radius * this.radius * 3.14;
	}
}
