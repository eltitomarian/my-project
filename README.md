# CI Workflow

Este documento describe un flujo de trabajo de GitHub Actions denominado "CI" (Integración Continua). 

## Activadores

El flujo de trabajo se dispara en las siguientes condiciones:

- **Push**: Cuando se realizan cambios en la rama `development`.

- **Workflow Dispatch**: Esto permite iniciar manualmente el flujo de trabajo desde la interfaz de usuario de GitHub. Se incluye un input opcional `build-or-tag-release` para elegir entre "Integración + Tag + Release" o solo "Integración".

## Jobs

El flujo de trabajo consiste en un job llamado `build`, el cual se ejecuta en la última versión de Ubuntu disponible en GitHub Actions.

### Pasos

- **Checkout**: Utiliza la acción `actions/checkout@v3` de GitHub para obtener una copia del repositorio.

- **Build & Push Image**: Este paso inicia sesión en Docker con las credenciales especificadas en los secretos del repositorio (`DOCKER_USERNAME` y `DOCKER_PASSWORD`), construye una imagen de Docker llamada `eltitomarian/test-uax:latest` y la publica en Docker Hub.

- **Print Success**: Si todos los pasos anteriores se completan con éxito, este paso imprimirá un mensaje indicando que la integración continua con Docker Hub fue exitosa y que se debe continuar con el flujo de trabajo de `ci-rl`.

## Secretos

Este flujo de trabajo requiere los siguientes secretos almacenados en las configuraciones del repositorio:

- `DOCKER_PASSWORD`: La contraseña de tu cuenta de Docker.
- `DOCKER_USERNAME`: El nombre de usuario de tu cuenta de Docker.

Por favor, asegúrate de que estos secretos están correctamente configurados en tu repositorio para que este flujo de trabajo funcione como se espera.

