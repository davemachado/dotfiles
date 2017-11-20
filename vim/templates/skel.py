#!/usr/bin/env python
# Sohit Pal

def main():
    MARKER

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt, e: # Ctrl-C
        raise e
    except Exception, e:
        print 'ERROR, UNEXPECTED EXCEPTION'
        print str(e)
        traceback.print_exc()
        os._exit(1)
