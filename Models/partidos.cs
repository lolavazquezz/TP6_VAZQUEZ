public class partido{
    public int idPartido{get; set;}
    public string nombre{get; set;}
    public string logo{get; set;}
    public string sitioWeb{get; set;}
    public DateTime fechaFundacion{get; set;}
    public int cantDiputados{get; set;}
    public int cantSenadores{get; set;}
    public partido(){}
    public partido(int ID, string Nom, string Log, string SW, DateTime FF, int CD, int CS){
        idPartido=ID;
        nombre=Nom;
        logo=Log;
        sitioWeb=SW;
        fechaFundacion=FF;
        cantDiputados=CD;
        cantSenadores=CS;
    }
}