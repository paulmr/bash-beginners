/* an example scala script that solves ex1, for comparison */

import java.io.File

def process(f: File, indent: Int = 0): Unit = {
  if(f.isDirectory)
    for(child <- f.listFiles) process(child)
  else if(!f.getName.endsWith(".gz"))
    /* ... either call out to `gzip` or use the JDK library... */
    Runtime.getRuntime.exec(Array("gzip", f.getPath))
}

process(new File("."))
