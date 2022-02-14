---           
layout: post
title: Substitution Cipher - Java
date: 2014-09-05 11:21:48 UTC
updated: 2014-09-05 11:21:48 UTC
comments: false
categories: 
---

<span style="font-family: Arial, Helvetica, sans-serif;"><b>Downloadable file :&nbsp;<a href="https://www.dropbox.com/s/os771blit1jemfe/subs_cipper.java">Substitution Cipher</a></b></span><br /><br /><br /><span style="font-family: Courier New, Courier, monospace;">import java.util.HashMap;</span><br /><span style="font-family: Courier New, Courier, monospace;">import java.util.Iterator;</span><br /><span style="font-family: Courier New, Courier, monospace;">import java.util.Map;</span><br /><span style="font-family: Courier New, Courier, monospace;"><br /></span><span style="font-family: Courier New, Courier, monospace;">public class subs_cipper {&nbsp;</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; public static void main(String[] args) {&nbsp;</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;"> </span> &nbsp;&nbsp;</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; System.out.println("This is to demonstrate the Substitution Cipher");</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; System.out.println("Each alphanumeric char is mapped to a String (arbitrarily, of two chars length)");</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; System.out.println("For example, 'A' is mapped to \"OA\", 'B' is mapped to \"9B\", and so on...");</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; System.out.print("\nTest String = ");</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; String plaintext = "WHYAMIDOINGTHISWHYAREWEHEREWHATAREWEDOING";</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; //string to be ciphered</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; //String plaintext = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";<span class="Apple-tab-span" style="white-space: pre;">&nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; //use this to check. With this,&nbsp;</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; //...plaintext = Keys, and Ciphertext = Values</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; System.out.print(plaintext);</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp;&nbsp;</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; //Encryption</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; System.out.println("\n\nCiphertext = ");</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; Cipher ObjCipher = new Cipher();</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; String ciphertext = ObjCipher.Encrypt(plaintext);<span class="Apple-tab-span" style="white-space: pre;">   &nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; //output ciphered string</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; System.out.println(ciphertext);</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp;&nbsp;</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; //Decryption</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; System.out.print("\nPlaintext = \n");</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; String outplaintext = ObjCipher.Decrypt(ciphertext); <span class="Apple-tab-span" style="white-space: pre;">  &nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; //output deciphered string</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; System.out.print(outplaintext);</span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp;}</span><br /><span style="font-family: Courier New, Courier, monospace;">}</span><br /><span style="font-family: Courier New, Courier, monospace;"><br /></span><span style="font-family: Courier New, Courier, monospace;"><br /></span><span style="font-family: Courier New, Courier, monospace;">//the class that that implements the actual encryption</span><br /><span style="font-family: Courier New, Courier, monospace;">class Cipher {</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">     </span>String keys, values;<span class="Apple-tab-span" style="white-space: pre;">          &nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp;//Keys &amp; Values for HashMap</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">     </span>String plaintext, ciphertext;<span class="Apple-tab-span" style="white-space: pre;">         </span></span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">     </span>HashMap&lt;String, String&gt; map = new HashMap&lt;String, String&gt;();<span class="Apple-tab-span" style="white-space: pre;">&nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp;//HashMap to do the mapping</span><br /><span class="Apple-tab-span" style="white-space: pre;"><span style="font-family: Courier New, Courier, monospace;"> </span></span><br /><span class="Apple-tab-span" style="white-space: pre;"><span style="font-family: Courier New, Courier, monospace;"> </span></span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">    </span>//constructor, instantiates the HashMap</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">    </span>public Cipher(){</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">    </span>//one-to-one mapping (Keys - Values) of different length. In this example,&nbsp;</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">    </span>//A:OA, B:9B, C:8C &amp; &nbsp;so on...</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">  </span> &nbsp;keys = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">    </span>values = "0A9B8C7F6E5R4F3T2J1K4LX2VN18K9LC42B7" +</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">    </span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";</span><br /><span class="Apple-tab-span" style="white-space: pre;"><span style="font-family: Courier New, Courier, monospace;">  </span></span><br /><span class="Apple-tab-span" style="white-space: pre;"><span style="font-family: Courier New, Courier, monospace;">  </span></span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">   </span>//use for loop to fill up &amp; map the Keys to the respective Values</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">   </span>for (int i=0; i&lt;keys.length(); i++){</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>char charkey = keys.charAt(i);<span class="Apple-tab-span" style="white-space: pre;">      &nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; &nbsp;//get each char from the Keys &amp; convert to String</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>String tempkey = Character.toString(charkey);</span><br /><span class="Apple-tab-span" style="white-space: pre;"><span style="font-family: Courier New, Courier, monospace;">   </span></span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>char charval1 = values.charAt(i*2);<span class="Apple-tab-span" style="white-space: pre;">     &nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; &nbsp;//get every two chars from the Values &amp; convert to String</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>String tempval1 = Character.toString(charval1);<span class="Apple-tab-span" style="white-space: pre;">  &nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; &nbsp;//...and concatenate both chars to form a single String</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>char charval2 = values.charAt(i*2+1);</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>String tempval2 = Character.toString(charval2);</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>String tempval = tempval1 + tempval2;<span class="Apple-tab-span" style="white-space: pre;">     </span></span><br /><span class="Apple-tab-span" style="white-space: pre;"><span style="font-family: Courier New, Courier, monospace;">   </span></span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>map.put(tempkey, tempval);<span class="Apple-tab-span" style="white-space: pre;">       &nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; &nbsp;//fill the HashMap</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">   </span>}</span><br /><span class="Apple-tab-span" style="white-space: pre;"><span style="font-family: Courier New, Courier, monospace;">  </span></span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;"> </span>}</span><br /><span class="Apple-tab-span" style="white-space: pre;"><span style="font-family: Courier New, Courier, monospace;"> </span></span><br /><span class="Apple-tab-span" style="white-space: pre;"><span style="font-family: Courier New, Courier, monospace;"> </span></span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">   </span>//Encrypt method, do the Encryption, takes Plaintext as argument</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">   </span>public String Encrypt(String plaintext){</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>String output = "";</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>char ch;</span><br /><span class="Apple-tab-span" style="white-space: pre;"><span style="font-family: Courier New, Courier, monospace;">  </span></span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">   </span>for (int i=0; i&lt;plaintext.length(); i++){<span class="Apple-tab-span" style="white-space: pre;">    &nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp;//go through the plaintext&nbsp;</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>ch = plaintext.charAt(i); &nbsp;<span class="Apple-tab-span" style="white-space: pre;">       &nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; &nbsp;//take each chars as 'Key'</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>String str = Character.toString(ch);<span class="Apple-tab-span" style="white-space: pre;">    &nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; &nbsp;//..and map to its corresponding 'Value'</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>output = output + map.get(str);</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">   </span>}</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;"> &nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp;return output;<span class="Apple-tab-span" style="white-space: pre;">           &nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp;//returns the the encrypted String</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;"> </span>}</span><br /><span class="Apple-tab-span" style="white-space: pre;"><span style="font-family: Courier New, Courier, monospace;"> </span></span><br /><span class="Apple-tab-span" style="white-space: pre;"><span style="font-family: Courier New, Courier, monospace;"> </span></span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">   </span>//Decrypt method, do the Decryption, takes Ciphertext as argument</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">   </span>public String Decrypt(String ciphertext){</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>String output = "";</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>char ch;</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>String str = "";</span><br /><span class="Apple-tab-span" style="white-space: pre;"><span style="font-family: Courier New, Courier, monospace;">  </span></span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">   </span>for (int i=0; i&lt;ciphertext.length(); i = i+2){<span class="Apple-tab-span" style="white-space: pre;">   &nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;"><span style="white-space: pre;">&nbsp;  </span>//get next two adjacent chars from the Ciphertext</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>ch = ciphertext.charAt(i); &nbsp;<span class="Apple-tab-span" style="white-space: pre;">      &nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; &nbsp;//concatenates them into a single String</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>str = Character.toString(ch);</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>ch = ciphertext.charAt(i+1);&nbsp;</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>str = str + Character.toString(ch);</span><br /><span class="Apple-tab-span" style="white-space: pre;"><span style="font-family: Courier New, Courier, monospace;">   </span></span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>Iterator j = map.entrySet().iterator();<span class="Apple-tab-span" style="white-space: pre;">    &nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; &nbsp;//look up through HashMap by the Value&nbsp;</span><br /><span style="font-family: Courier New, Courier, monospace;"><br /></span><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>while (j.hasNext()) {<span class="Apple-tab-span" style="white-space: pre;">        &nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; &nbsp;//...to find the corresponding Key</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">           </span>Map.Entry entry = (Map.Entry) j.next();<span class="Apple-tab-span" style="white-space: pre;"> </span></span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">           </span>if (str.equals((String)entry.getValue())){<span class="Apple-tab-span" style="white-space: pre;">  &nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //concatenates the output with each Key found</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">                </span>output = output + (String)entry.getKey();</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">           </span>}</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">       </span>}</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">  </span>}</span><br /><span style="font-family: Courier New, Courier, monospace;"><br /></span><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;">  </span>return output;<span class="Apple-tab-span" style="white-space: pre;">           &nbsp;</span></span><br /><span style="font-family: Courier New, Courier, monospace;">&nbsp; //return the Decrypted String</span><br /><span style="font-family: Courier New, Courier, monospace;"><span class="Apple-tab-span" style="white-space: pre;"> </span>}</span><br /><span class="Apple-tab-span" style="white-space: pre;"><span style="font-family: Courier New, Courier, monospace;">  </span></span><br /><span style="font-family: Courier New, Courier, monospace;">}</span><br /><span style="font-family: Courier New, Courier, monospace;"><br /></span><span style="font-family: Courier New, Courier, monospace; font-size: x-small;"><br /></span>