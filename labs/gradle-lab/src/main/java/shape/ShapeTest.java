package shape;

public class ShapeTest {
	private static void checkAll(Shape[] shapes, double totalArea, Shape max) {
		assert Shapes.max(shapes, AreaComparator.instance) == max;
		assert shapes[0].getCenter().overlaps(new Point(0, 0));
		assert shapes[1].getCenter().overlaps(new Point(-1, -1));
		assert shapes[2].getCenter().overlaps(new Point(1, 1));
		assert Shapes.totalArea(shapes) == totalArea;
	}

	public static void main(String[] args) {
		Shape[] shapes = { Circle.ofRadiusCenter(2, new Point(1, 1)), Circle.ofRadius(1),
				Rectangle.ofWidthHeightCenter(1, 2, new Point(2, 2)) };
		double totalArea = Shapes.totalArea(shapes);
		Shape max = Shapes.max(shapes, AreaComparator.instance);
		Shapes.moveAll(shapes, -1, -1);
		ShapeTest.checkAll(shapes, totalArea, max);
		Shapes.scaleAll(shapes, .5);
		ShapeTest.checkAll(shapes, totalArea * .25, max);
		for (Shape s : shapes)
			s.getCenter().move(1, 1); // non deve spostare le figure
		ShapeTest.checkAll(shapes, totalArea * .25, max);
	}
}
