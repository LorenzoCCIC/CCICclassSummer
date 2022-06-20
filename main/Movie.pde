public class Movie {
  int cost;
  String genre;
  String name;
  
  public Movie (int c, String g, String n) {
    cost = c;
    genre = g;
    name = n;
  }
  
  public String title() {
    return(name);
  }
  
  public String genre() {
    return(genre);
  }
  public int price() {
    return(cost);
  }
  
  public String allData() {
     
    return("This movie is called: " + name + "                                                                                                                                                                                                                                                                               "  + "This genre is: " + genre + "                                                                                                                                                                                                                                                                                           " + "The cost to make the movie was: " + cost);
  }
}
