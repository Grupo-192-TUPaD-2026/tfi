# Estructura de repositorio requerida para la 2ª Entrega

Comandos para armar la estructura desde la raíz del repo (sin código todavía, solo carpetas y archivos base):

```bash
mkdir -p docs/01-planificacion-y-viabilidad
mkdir -p docs/02-requerimientos-y-analisis
mkdir -p docs/03-diseno-y-arquitectura
mkdir -p docs/04-pruebas-y-calidad
mkdir -p docs/05-despliegue-y-entrega
mkdir -p database
mkdir -p src/backend
mkdir -p src/frontend

# Copiar los documentos de esta entrega a su carpeta:
cp 02-listado-de-modulos.md docs/03-diseno-y-arquitectura/
cp 02-arquitectura.md docs/03-diseno-y-arquitectura/
cp 03-esquema-base-datos.md docs/03-diseno-y-arquitectura/
cp schema.sql database/

# Placeholders para que las carpetas de código queden creadas (sin implementación aún)
touch src/backend/.gitkeep
touch src/frontend/.gitkeep

git add .
git commit -m "2da entrega: esquema de BD, listado de módulos y arquitectura"
git push
```

## Checklist antes de subir

- [ ] `docs/03-diseno-y-arquitectura/02-listado-de-modulos.md`
- [ ] `docs/03-diseno-y-arquitectura/02-arquitectura.md`
- [ ] `docs/03-diseno-y-arquitectura/03-esquema-base-datos.md` (con el diagrama Mermaid — GitHub lo renderiza solo)
- [ ] `database/schema.sql`
- [ ] Carpetas `src/backend` y `src/frontend` creadas (vacías o con `.gitkeep`)
- [ ] `README.md` en la raíz actualizado (descripción + tecnologías — ya lo tienen bastante completo)
- [ ] Avisarle a Schiavonni que está listo para revisión
- [ ] Marcar la tarea del campus como finalizada (recordá: eso NO reemplaza subir al repo)
