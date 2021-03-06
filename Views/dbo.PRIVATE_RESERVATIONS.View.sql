USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[PRIVATE_RESERVATIONS]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PRIVATE_RESERVATIONS]
as
SELECT DISTINCT PR.ReservationID,
      PR.TimeFrom as 'Reservation Start',
      PR.TimeTo as 'Reservation End',
      PSH.TimeFrom as 'Status Start',
      PSH.TimeTo as 'Status End',
      RS.StatusName as 'Status',
      PC.Fristname + ' ' + PC.Lastname as 'Person Assigned',
      P.TableID as 'Assigned Table' from PrivateReservations PR
INNER JOIN PrivateStatusHistories PSH on PR.ReservationID = PSH.ReservationID
INNER JOIN ReservationStatuses RS on PSH.StatusID = RS.StatusID
INNER JOIN PrivateReservationDetails PRD on PR.ReservationID = PRD.ReservationID
INNER JOIN PrivateReservationDetails P on PR.ReservationID = P.ReservationID
Inner JOIN PrivateCustomers PC on PR.CustomerID = PC.PrivateCustomerID
GO
