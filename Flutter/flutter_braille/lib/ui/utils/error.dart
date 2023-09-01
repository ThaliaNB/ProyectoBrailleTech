import 'package:flutter_braille/domain/models/jetz_exception.dart';
import 'package:flutter_braille/ui/utils/toast.dart';

class ErrorP {
  final _genericError = 'Ha ocurrido un error inesperado';
  final _dictionaryError = {
    'invalid-verification-code': 'Código de verificación inválido',
    'request_cancel': 'Ha ocurrido un error inesperado, intenta nuevamente',
    'request_connect_timeout': 'Ha ocurrido un error inesperado, intenta nuevamente',
    'request_unknow': 'Ha ocurrido un error inesperado, intenta nuevamente',
    'request_recive_timeout': 'Ha ocurrido un error inesperado, intenta nuevamente',
    'request_send_timeout': 'Ha ocurrido un error inesperado, intenta nuevamente',
    'unknow_code': 'Ha ocurrido un error inesperado, intenta más tarde',
    'E0001': 'El correo electrónico que ingresaste no es válido, por favor verifícalo',
    'E0002': 'Por favor ingresa un número de celular',
    'E0003': 'Por favor ingresa una contraseña',
    'E0004': 'Una solicitud de registro ya había sido enviada anteriormente, para mas información comunícate con nosotros',
    'E0005': 'El teléfono que ingresaste ya se encuentra registrado',
    'E0006': 'El usuario se encuentra desactivado por el momento, comunícate con nosotros para más información',
    'E0007': 'Por favor ingresa un correo electrónico',
    'E0008': '¡Ups! El número de celular debe de contener 10 dígitos',
    'N/A': '¡Ups! Las contraseñas ingresadas no coinciden',
    'E0010': '¡Ups! Ocurrió un problema al intentar acceder a tu cuenta, intenta ingresar nuevamente',
    'E0011': '¡Ups! La contraseña debe contener al menos 6 caracteres',
    'E0012': 'Se tienen problemas al intentar encontra la cuenta de usuario, intenta ingresar nuevamente',
    'E0013': '¡Ups! ocurrió un problema al intentar actualizar la dirección de envio, intente nuevamente',
    'E0014': 'La dirección es requerida y no puede ser eliminada, por favor verifique e intenta nuevamente',
    'E0015': 'Hay un problema al intentar acceder a este registro, intenta más tarde',
    'E0016': 'El usuario o la contraseña que ingresaste son incorrectos',
    'E0017': 'Por favor ingresa un nombre de contacto',
    'E0018': 'Por favor ingresa una dirección',
    'E0019': 'El celular o correo electrónico que ingresaste son incorrectos',
    'E0020': 'El usuario que ingresaste es inválido',
    'E0021': '¡Ups! El proceso de recuperación ha caducado o es inválido, intenta nuevamente.',
    'E0022': 'Tu sesión ha expirado y no pudimos volver a conectarte, intenta ingresar nuevamente.',
    'E0023': 'El nombre del negocio es muy corto, por favor verifícalo',
    'E0024': 'Información de solicitud de cotización no válida',
    'E0025': 'No hay productos para cotizar',
    'E0026': 'Categoría no encontrada',
    'E0027': 'Vehículo no encontrado',
    'E0032': 'Saldo insuficiente',
    'E0065': 'Información de usuario no válida',
    'I0001': 'Lo sentimos la sesión ha expirado, por favor vuelve a ingresar',
    'I0002': 'Usuario conectado con éxito, redirigiendo...',
    'I0003': 'Aún no tienes instalado Jetz en tu celular, de clic aquí para agregarlo a tu pantalla de inicio',
    'I0004': 'Tu solicitud ha sido procesada',
    'I0005': 'Tu contraseña ha sido actualizada con exito',
    'I0006': 'Tu información a sido actualizada con exito',
    'I0007': 'Si la cuenta se encuntra registrada te llegará un SMS para el cambio contraseña. Si tiene problemas comuniquese a soporte',
    'E0056': 'El código de referido no existe',
    'CI001': 'No se pudo obtener la dirección.',
    'CI002': 'No se pudo capturar la foto porque la operación fue cancelada por el usuario.',
    'CI003': 'No se pudo obtener la imagen porque la Operación fue cancelada por el usuario.',
    'CI004': 'No se pudo actualizar la información de facturación.',
    'CI005': 'No se pudo actualizar la dirección.',
    'CI006': 'No se pudo obtener el archivo, porque la Operación fue cancelada por el usuario.',
    'E0060': 'Hay una cita activa',
    'E0057': '¡Ups! operación no permitida, el proceso de facturación ya se inició.',
    'E0099': 'Pagos en OXXO solo permite pagos de \$10 a \$10,000 MXN, intenta otra opción de pago.',
  };

  String getErrorByCode(String code) {
    return _dictionaryError[code] ?? _genericError;
  }

  void showToast(JetzException exception) {
    final errorDescription = getErrorByCode(exception.code);
    Toast.showErrorToast(errorDescription);
  }

  void showToastWithCode(JetzException exception) {
    final errorDescription = getErrorByCode(exception.code);
    Toast.showErrorToast('$errorDescription - ${exception.code}');
  }
}
