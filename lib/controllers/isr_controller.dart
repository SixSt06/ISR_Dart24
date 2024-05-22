import 'package:isr_dart24/isr_dart24.dart';
import 'package:isr_dart24/models/rango_isr.dart';
import 'package:isr_dart24/utils/constants.dart';

class ISRController extends ResourceController {
  //Cada controller puede tener 2 GET, 1 POST, 1 PUT, 1 DELETE
  @Operation.get()
  Future<Response> getAll() async {
    final List<Map<String, dynamic>> listRangos =
        rangoISR.map((rango) => rango.toJson()).toList();

    final Response response = Response.ok(listRangos)
      ..contentType = ContentType.json;

    return response;
  }

  @Operation.get("monto")
  Future<Response> getImpuesto(@Bind.path('monto') double monto) async {
    final rangoJSON = rangoISR
        .firstWhere((rango) => rango.estaDentroDelRango(monto),
            orElse: () => RangoISR(
                limiteInferior: 0,
                limiteSuperior: 0,
                cuotaFija: 0,
                porcentajeExcedente: 0))
        .toJson();
    final Response response = Response.ok(rangoJSON)
      ..contentType = ContentType.json;
    return response;
  }
}
