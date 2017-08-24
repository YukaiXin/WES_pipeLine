
package com.company;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.lang.System;
import java.lang.String;
import java.lang.Math;


/**
 * Created by yuki_cool on 2017/8/22.
 */


public class depth {

    public static void main(String[] args) throws IOException  {
    // write your code here
       # System.out.println("Start !!!");
       # Depth depth = new Depth();
        #depth.readFile(args[1]);
       # depth.MathDepth(args[2]);
        
        System.out.println("Success !!!");
    }
}

class Depth {
    public     int sum = 0;
    public   int tem_sum = 0;
    /**
     * 写文件
     *
     * @param filePath
     * @param
     * @throws IOException
     */
    public synchronized void writeFile(String filePath, String content)
            throws IOException {
        FileWriter fw = new FileWriter(filePath);
        PrintWriter out = new PrintWriter(fw);
        out.write(content);
        out.println();
        fw.close();
        out.close();
    }

    /**
     * 读文件
     *
     * @param filename
     * @return
     */
    private List<String> lineList = new ArrayList<>();

    public  String readFile(String filepath) {
        File file = new File(filepath);
        InputStream inputStream = null;
        BufferedReader bufferedReader = null;
        try {
            inputStream = new FileInputStream(file);
            String content = "";
            if (inputStream != null) {
                bufferedReader = new BufferedReader(new InputStreamReader(
                        inputStream));
                String line = "";
                while ((line = bufferedReader.readLine()) != null) {




                }
            }
            return content;
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            try {
                if (bufferedReader != null) {
                    bufferedReader.close();
                    bufferedReader = null;
                }
                if (inputStream != null) {
                    inputStream.close();
                    inputStream = null;
                }
            } catch (Exception e) {
                System.out.println(e.toString());
            }
        }

        return null;
    }

    public void MathDepth(String path) throws IOException {
        for (int i = 0 ; i <= 500 ; i ++){
            sum += mMapDepth.get(i);
        }
        tem_sum = sum;
        for (int i = 0 ; i <= 500 ; i ++){
            int count = mMapDepth.get(i);
            int p = Math.round(count/ sum);
            int a = Math.round(tem_sum - count/sum);
            String tem_line = String.valueOf(i)+"\t"+String.valueOf(count)+"\t"+String.valueOf(p)+"\t"+String.valueOf(a)+"\n";
            writeFile(path, tem_line);
        }

    }

    public  byte[] readByte(final InputStream in) throws IOException {
        ByteArrayOutputStream output = null;
        try {
            if (in == null) {
                return null;
            }
            output = new ByteArrayOutputStream(1024 * 2);
            byte[] buffer = new byte[1024];
            int len;
            while ((len = in.read(buffer)) != -1) {
                output.write(buffer, 0, len);
            }
            return output.toByteArray();
        } finally {
            if (output != null) {
                try {
                    output.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public  boolean saveObject(Serializable serializable,
                                     String filePath) {
        try {
            FileOutputStream fout = new FileOutputStream(filePath);
            ObjectOutputStream oos = new ObjectOutputStream(fout);
            oos.writeObject(serializable);
            oos.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
public  HashMap<Integer, Integer> mMapDepth = new HashMap<>();
boolean is_fa = true;

synchronized   public void summary_depth(String line) {
        String[] depth_stas = line.split("\t");
        int i = Integer.valueOf(depth_stas[2]);
        if (i >= 500) {
            if (mMapDepth.get(i) != null)
                if (is_fa == false){
                    is_fa = true;
                    mMapDepth.put(i, 1);
                }else {
                    int tem = mMapDepth.get(i) +1 ;
                    mMapDepth.put(i, tem);
                }
        }else {
            if (mMapDepth.get(i) != null){
                    mMapDepth.put(i, 1);
                }else {
                    int tem = mMapDepth.get(i) +1 ;
                    mMapDepth.put(i, tem);
                }
        }
        
    }
}
