package com.rct.app.activity;

import android.content.Context;
import android.os.Bundle;
import android.widget.ListView;
import android.widget.ArrayAdapter;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import com.android.volley.Request;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.Volley;
import com.rct.app.R;
import com.rct.app.api.ApiConfig;
import com.rct.app.utils.LocaleHelper;
import org.json.JSONException;
import org.json.JSONObject;
import java.util.ArrayList;

public class PatientListActivity extends BaseActivity {

    ListView listView;
    ArrayList<String> patientList;
    ArrayAdapter<String> adapter;

    @Override
    protected void attachBaseContext(Context newBase) {
        super.attachBaseContext(LocaleHelper.applyLocale(newBase));
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_patient_list);

        listView    = findViewById(R.id.listView);
        patientList = new ArrayList<>();
        adapter     = new ArrayAdapter<>(this,
                android.R.layout.simple_list_item_1, patientList);
        listView.setAdapter(adapter);

        loadPatients();
    }

    private void loadPatients() {
        JsonArrayRequest request = new JsonArrayRequest(
                Request.Method.GET,
                ApiConfig.GET_PATIENTS,
                null,
                response -> {
                    patientList.clear();
                    for (int i = 0; i < response.length(); i++) {
                        try {
                            JSONObject obj = response.getJSONObject(i);
                            patientList.add(
                                    obj.getString("name") +
                                            " | " + obj.getString("email") +
                                            " | " + obj.getString("phone")
                            );
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                    adapter.notifyDataSetChanged();
                },
                error -> Toast.makeText(this,
                        "Error loading patients",
                        Toast.LENGTH_SHORT).show()
        );
        Volley.newRequestQueue(this).add(request);
    }
}