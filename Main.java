import clases.Carrito;
import clases.Producto;
import clases.Usuario;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gu
public class Main {

    // Crear productos genéricos
    Producto producto1 = new Producto(1, "Producto 1", "Descripción del Producto 1", 100.0, 10);
    Producto producto2 = new Producto(2, "Producto 2", "Descripción del Producto 2", 200.0, 20);
    Producto producto3 = new Producto(3, "Producto 3", "Descripción del Producto 3", 50.0, 50);

    // Crear usuario y su carrito
    Usuario usuario = new Usuario(1, "Usuario 1", "usuario1@example.com", "Calle 1 123", "555-1234");
    Carrito carrito = usuario.getCarrito();

    Usuario nuevoUsuario=new Usuario(2,"pepe","pepe@ejemple.com","Calle melancolia 2 321","123123123");
    Carrito carritoNuevo=nuevoUsuario.getCarrito();



    // Agregar productos al carrito



    }
}
