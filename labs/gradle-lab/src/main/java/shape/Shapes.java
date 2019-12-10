package shape;

public class Shapes {

	/*
	 * restituisce la figura maggiore rispetto al comparator comp, null se l'array e` vuoto
	 */
	public static Shape max(Shape[] shapes, ShapeComparator comp) {
    if(shapes.length == 0)
      return null;

    Shape max = shapes[0];
    for (int i = 1; i < shapes.length; i++) {
      if(comp.compare(max, shapes[i]) > 0)
        max = shapes[i];
    }

    return max;
	}

	/*
	 * trasla tutte le figure lungo il vettore (dx,dy)
	 */
	public static void moveAll(Shape[] shapes, double dx, double dy) {
    for (int i = 0; i < shapes.length; ++i) {
      shapes[i].move(dx, dy);      
    }
	}

	/*
	 * scala tutte le figure del fattore factor > 0, senza traslare il loro centro
	 */
	public static void scaleAll(Shape[] shapes, double factor) {
	    // completare
	}

	/*
	 * restituisce l'area totale di tutte le figure
	 */
	public static double totalArea(Shape[] shapes) {
	    // completare
	}
}
