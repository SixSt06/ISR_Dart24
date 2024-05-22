class RangoISR {
  RangoISR(
      {required this.limiteInferior,
      required this.limiteSuperior,
      required this.cuotaFija,
      required this.porcentajeExcedente});

  double limiteInferior;
  double limiteSuperior;
  double cuotaFija;
  double porcentajeExcedente;

  bool estaDentroDelRango(double ingreso) {
    return ingreso >= limiteInferior && ingreso <= limiteSuperior;
  }

  double calcularImpuesto(double ingreso) {
    if (estaDentroDelRango(ingreso)) {
      return cuotaFija +
          ((ingreso - limiteInferior) * (porcentajeExcedente / 100));
    }
    return 0.0;
  }

  Map<String, dynamic> toJson() {
    return {
      'limiteInferior': limiteInferior,
      'limiteSuperior': limiteSuperior,
      'cuotaFija': cuotaFija,
      'porcentajeExcedente': porcentajeExcedente
    };
  }
}
