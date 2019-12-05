package lab04_12_05;

/*
 * Classe singleton con una sola istanza.
 * 
 * Confronta le figure basandosi sulle loro aree.
 */

public class AreaComparator implements ShapeComparator {

	public static final AreaComparator instance = new AreaComparator();

	private AreaComparator() {
	}

	public int compare(Shape shape1, Shape shape2) {
	    // completare
	}

}
