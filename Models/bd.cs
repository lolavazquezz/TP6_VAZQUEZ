using System.Data.SqlClient;
using Dapper;
namespace TP6_VAZQUEZ.Models;

public static class bd{
    private static string ConnectionString= @"Server=localhost;DataBase=elecciones;Trusted_Connection=True;";
    public static void eliminarCandidato(int idCandidato)
    {
        using (SqlConnection bd = new SqlConnection(ConnectionString))
        {
            string sql = "DELETE FROM candidato WHERE idCandidato = @idCandidato";
            bd.Execute(sql, new {candidato=idCandidato});
        }
    }
    public static void agregarCandidato(candidato can)
    {
        using (SqlConnection bd = new SqlConnection(ConnectionString))
        {
            string sql = "INSERT INTO candidato(idPartido, nombre, apellido, foto, fechaNacimiento, postulacion) VALUES ( @idPartido, @nombre, @apellido, @foto, @fechaNacimiento, @postulacion)";
            bd.Execute(sql, new {@idPartido=can.idPartido, @nombre=can.nombre, @apellid=can.apellido, @foto=can.foto, @fechaNacimiento=can.fechaNacimiento, @postulacion=can.postulacion});
        }
    }
    public static partido verInfoPartido(int idPartido){
        partido partidoElegido;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM partido WHERE idPartido=@pidPartido";
            partidoElegido = db.QueryFirstOrDefault<partido>(sql, new { pidPartido = idPartido});
        }
        return partidoElegido;
    }
    public static candidato verInfoCandidato(int idCandidato){
        candidato candidatoElegido;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM candidato WHERE idCandidato=@pidCandidato";
            candidatoElegido = db.QueryFirstOrDefault<candidato>(sql, new { pidCandidato = idCandidato});
        }
        return candidatoElegido;
    }
    public static List<partido> listarPartidos(){
         List<partido>listaPartido=new List<partido>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM partido";
            listaPartido = db.Query<partido>(sql).ToList();
        }
        return listaPartido;
    }
    public static List<candidato> listarCandidatos(int idPartido){
        List<candidato>listaCandidato=new List<candidato>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM candidato where idPartido=@pidPartido";
            listaCandidato = db.Query<candidato>(sql, new { pidPartido = idPartido}).ToList();
        }
        return listaCandidato;
    }
}