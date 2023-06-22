public class candidato{
    public int idCandidato{get; set;}
    public int idPartido{get; set;}
    public string nombre{get; set;}
    public string apellido{get; set;}
    public string foto{get; set;}
    public DateTime fechaNacimiento{get; set;}
    public string postulacion{get; set;}
    public candidato(){}
    public candidato(int IDC, int IDP, string Nom, string Ape, string Foto, DateTime FN, string Post){
        idCandidato=IDC;
        idPartido=IDP;
        nombre=Nom;
        apellido=Ape;
        foto=Foto;
        fechaNacimiento=FN;
        postulacion=Post;
    }
}