/// @description session_by_tag(tag)
/// @param tag
function session_by_tag(argument0) {
	tag = string_upper(argument0);
	current = 1;

	repeat(gms_session_count())
	{
	   if (string_upper(gms_session_tag(current)) = string_upper(tag)){
	      if (gms_session_exists(gms_session_id(current))){
	         return gms_session_id(current);
	      }
	   }
	   current += 1;
	}

	return -1;



}
