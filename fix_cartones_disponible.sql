-- Agregar estado 'disponible' a cartones y permitir jugador_id null
alter table cartones 
  drop constraint if exists cartones_estado_check;

alter table cartones 
  add constraint cartones_estado_check 
  check (estado in ('disponible','pendiente','aprobado','rechazado'));

alter table cartones 
  alter column jugador_id drop not null;

-- Política para que jugadores vean cartones disponibles
drop policy if exists "cartones_select" on cartones;
create policy "cartones_select" on cartones
  for select using (true);
