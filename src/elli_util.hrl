-include_lib("kernel/include/logger.hrl").

%% Bloody useful
-define(IF(Test,True,False), case Test of true -> True; false -> False end).

-ifdef(OTP_RELEASE).
-define(OTP_VERSION, list_to_integer(erlang:system_info(otp_release))).
-else.
-define(OTP_VERSION, 0). % Fallback, but should not happen on OTP 23+.
-endif.

%% If OTP version is 25 or higher, use ets:table(), otherwise use ets:tid()
-ifdef(OTP_RELEASE).
-define(IS_OTP_25, ?OTP_VERSION >= 25).
-else.
-define(IS_OTP_25, false).
-endif.
