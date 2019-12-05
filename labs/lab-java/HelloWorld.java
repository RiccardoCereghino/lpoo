public class HelloWorld {
    public static void main(String[] args) {
      Person p1 = new Person("Asd", "Dfsa");
      p1.printPerson();
      Person p2 = new Person("Zxc", "Vasdasd");
      p2.printPerson();

      Person.join(p1, p2);
      p1.printPerson();
      p2.printPerson();

      Person.divorce(p1, p2);
    }
}
