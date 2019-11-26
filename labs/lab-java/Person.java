public class Person {
  private final String name;
  private final String surname;
  private final long socialSN;
  private static long nextSN;
  private Person spouse;

  /* invariant socialSN >= 0 */
  /* invariant !name.matches("[A-Z][a-z]+([A-Z][a-z]+)*") */
  /* invariant !surname.matches("[A-Z][a-z]+([A-Z][a-z]+)*") */

  public Person(String name, String surname) {
    if(!name.matches("[A-Z][a-z]+([A-Z][a-z]+)*")
        || !surname.matches("[A-Z][a-z]+([A-Z][a-z]+)*"))
      throw new IllegalArgumentException();


    this.name = name;
    this.surname = surname;

    this.socialSN = Person.nextSN++;
  }

  public void printPerson(){
    System.out.print("-----\n");
    System.out.print("Name: " + this.name + "\n");
    System.out.print("Surname: " + this.surname + "\n");
    System.out.print("Is single: " + this.isSingle() + "\n");
    if (!this.isSingle()) {
      System.out.print("Spouse:" + this.spouse.socialSN + "\n");
    }
    System.out.print("-----\n");
  }

  public boolean isSingle(){
    return this.spouse == null;
  }

  public static void join(Person p1, Person p2) {
    if (p1.socialSN == p2.socialSN)
      throw new IllegalArgumentException();

    if(!(p1.isSingle() && p2.isSingle()))
      throw new IllegalArgumentException();

    p1.spouse = p2;
    p2.spouse = p1;
  }

  public static void divorce(Person p1, Person p2) {
    if(p1.socialSN == p2.socialSN
        || p1.isSingle()
        || p2.isSingle()
        || ( p1.spouse.socialSN != p2.socialSN
          || p2.spouse.socialSN != p1.socialSN
          )
        )
      throw new IllegalArgumentException();

    p1.spouse = null;
    p2.spouse = null;
  }
}
