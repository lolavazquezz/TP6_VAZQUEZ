using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP6_VAZQUEZ.Models;

namespace TP6_VAZQUEZ.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult index()
    {
        ViewBag.listaPartidos = bd.listarPartidos();
        return View("Index");
    }
    
    public IActionResult verDetallePartido(int idPartido)
    {
        ViewBag.detallePartido= bd.verInfoPartido(idPartido);
        ViewBag.listaCandidatos= bd.listarCandidatos(idPartido);
        return View("verDetallePartido");
    }
    public IActionResult verDetalleCandidato(int idCandidato)
    {
        ViewBag.detalleCandidato= bd.verInfoCandidato(idCandidato);
        return View("verDetalleCandidato");
    }
    public IActionResult agregarCandidato(int idPartido)
    {
        ViewBag.idPartido=idPartido;
        return View("agregarCandidato");
    }
    [HttpPost] public IActionResult guardarCandidato(candidato can)
    {
        bd.agregarCandidato(can);
        return RedirectToAction("verDetallePartido", new{can.idPartido});
    }
    public IActionResult eliminarCandidato(int idCandidato, int idPartido){
        bd.eliminarCandidato(idCandidato);
        return RedirectToAction("verDetallePartido", new{idPartido=idPartido});
    }
    public IActionResult elecciones(){
        return  View("elecciones");
    }
    public IActionResult creditos(){
        return View("creditos");
    }
    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
