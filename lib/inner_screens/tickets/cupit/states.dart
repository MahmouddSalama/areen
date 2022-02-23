abstract class TicketState{}
class TicketInit extends TicketState{}
class TicketLoading extends TicketState{}
class TicketSuccse extends TicketState{}
class TicketError extends TicketState{
 final String _error;
  TicketError(this._error);
}